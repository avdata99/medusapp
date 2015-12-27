<?php

class User_model extends CI_Model
    {
    function login($user, $pass)
        {
        
        $q = "select * from usuario where login='$user' and password=MD5('$pass')";
        
        $query = $this->db->query($q);
        if (!$query) 
            {
            $this->logout();

            $txt = "Error sql ($q)";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return false;}
        
        if ($query->num_rows() == 0) 
            {
            $this->logout();
            
            $txt = "Error de acceso [$user] [$pass] [".md5($pass)."]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);

            return false;
            }

        $res = $query->row();
        $sess = array('user_name'=>$res->nombre, 'user_login'=>$res->login, 'user_id'=>$res->id);
        #set roles -------------------------------
        $sess['roles'] = $this->readRoles($res->id);
        
        # set permissions ------------------------
        $sess['permissions'] = $this->readPermissions($res->id);
        # get govs
        $govs = $this->readUserGovs($res->id);
        $sess['govs'] = $govs;
        $sess['govs_in'] = implode(',', $govs); // para consultas WHERE x IN (STR)
        # --------------------------------------
        # get obss
        $obss = $this->readUserObs($res->id);
        $sess['obss'] = $obss;
        $sess['obss_in'] = implode(',', $obss); // para consultas WHERE x IN (STR)
        # --------------------------------------
        # get govs
        $empresas = $this->readUserEmpresas($res->id);
        $sess['empresas'] = $empresas;
        $sess['empresas_in'] = implode(',', $empresas); // para consultas WHERE x IN (STR)
        # --------------------------------------
        $this->session->set_userdata($sess);
        return true;

        }

    public function logout(){
        $sess = array('user_name'=>'', 'user_login'=>'', 'user_id'=>0);
        $this->session->set_userdata($sess);
    }

    public function readRoles($user_id){
        $q = 'SELECT r.* FROM rol r
                join usuario_rol ur on r.id = ur.id_rol
                where ur.id_usuario = ' . $user_id;
        $query = $this->db->query($q);
        $roles = array();
        foreach ($query->result() as $rol) {
            $roles[] = $rol->nombre;
        }
        return $roles;
    }

    public function readPermissions($user_id){
        $q = 'SELECT p.* FROM permiso p
                join permiso_rol pr on pr.id_permiso = p.id
                join rol r on pr.id_rol = r.id
                join usuario_rol ur on r.id = ur.id_rol
                where ur.id_usuario = ' . $user_id;
        $query = $this->db->query($q);
        $permissions = array();
        foreach ($query->result() as $permission) {
            $permissions[] = $permission->nombre;
        }
        return $permissions;
    }

    /**
    Ver que sobre que gobiernos tiene permisos el usuario
    */
    public function readUserGovs($user_id){
        $q = 'SELECT id_gobierno from usuario_gobiernos where id_usuario=' . $user_id;
        $query = $this->db->query($q);
        $govs = array();
        foreach ($query->result() as $gov) {
            $govs[] = $gov->id_gobierno;
        }
        return $govs;   
    }

    /**
    Ver que sobre que observadores tiene permisos el usuario
    */
    public function readUserObs($user_id){
        $q = 'SELECT id_observador from usuario_observadores where id_usuario=' . $user_id;
        $query = $this->db->query($q);
        $obss = array();
        foreach ($query->result() as $obs) {
            $obss[] = $obs->id_observador;
        }
        return $obss;   
    }

    /**
    Ver que sobre que municipios tiene permisos el usuario
    */
    public function readUserEmpresas($user_id){
        $q = 'SELECT id_empresa from usuario_empresas where id_usuario=' . $user_id;
        $query = $this->db->query($q);
        $empresas = array();
        foreach ($query->result() as $empresa) {
            $empresas[] = $empresa->id_empresa;
        }
        return $empresas;   
    }


    /**
    Ver si un usuario puede acceder a algo en particular
    id2 es el ID de empresa, gobierno, etc (no implementado)
    Hay que agregar funcionalidades para permisos especificos #TODO
    */
    public function can($permission, $id2 = 0){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        # el usuario full_admin puede hacer todo
        if (in_array('FULL_ADMIN', $sess['roles'])) return true;

        // pide un permiso general
        if ($id2 == 0){ 
            return in_array($permission, $sess['permissions']);
        }

        if ($id2 > 0){
            // el usuario que puede editar una licitacion es solo sobre los gobiernos a los que esta conectado
            if ($permission == 'EDIT_GOVS'){
                return in_array($id2, $sess['govs']);
            }
            elseif ($permission == 'EDIT_LICITACION'){
                //TODO buscar el ID del gobierno para saber si este usuario puede tocar
            }
        }
        
    }
    /**
    Ver si un usuario tiene un rol
    */
    public function hasRole($role){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        return in_array($role, $sess['roles']);
    }

    public function nice_name(){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        return $sess['user_name'].' ('.$sess['user_login'].')';
    }

    private function get_sess(){
        $sess = $this->session->all_userdata();
        if (!$sess || !isset($sess['user_id'])) return FALSE; # lost session
        return $sess;
    }
    /* ver a que empresas representa */
    public function empresas(){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        
        return $sess['empresas'];
    }

    /* ver a que empresas representa */
    public function gobiernos(){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        
        return $sess['govs'];
    }

    /* ver a que observadores representa */
    public function observadores(){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        
        return $sess['obss'];
    }

    /**
    Indicar si corresponde un where in para las listas de objetos de una clase
    Return False si no es necesario
    */
    public function getWhereIn($class){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        
        if (in_array('FULL_ADMIN', $sess['roles'])) 
            return false;

        // el usuario que puede editar una licitacion es solo sobre los gobiernos a los que esta conectado
        // por lo tanto no uso class 'LICITACIONES', en estas uso GOVS
        if ($class == 'GOVS'){return $sess['govs_in'];}
        if ($class == 'EMPS'){return $sess['empresas_in'];}
        if ($class == 'OBSS'){return $sess['obss_in'];}

    }

    /** lista de id permitidos de una clase */
    public function getWhere($class){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;
        
        if (in_array('FULL_ADMIN', $sess['roles'])) 
            return false;

        // el usuario que puede editar una licitacion es solo sobre los gobiernos a los que esta conectado
        // por lo tanto no uso class 'LICITACIONES', en estas uso GOVS
        if ($class == 'GOVS'){return $sess['govs'];}
        if ($class == 'EMPS'){return $sess['empresas'];}
        if ($class == 'OBSS'){return $sess['obss'];}

    }

    /*
    Analizar que perfiles tiene disponible un usuario al entrar a una licitacion
    Es posible que sea como una (o más) empresas, gobierno u observador
    */
    public function detect_licitacion_profiles($licitacion_id){
        $sess = $this->get_sess();
        if (!$sess) return FALSE;

        $this->load->model('licitaciones_model');
        $licitacion = $this->licitaciones_model->load_by_id($licitacion_id);
        if (!$licitacion) return FALSE;

        $ret = [];
        // ver si es el gobierno
        if (in_array($licitacion->gobierno_id, $sess['govs'])) {
            $ret['gobiernos'] = [$licitacion->gobierno_id]; }
        else { $ret['gobiernos'] = []; }

        // ver observador
        if (in_array($licitacion->observador_id, $sess['obss'])) {
            $ret['observadores'] = [$licitacion->observador_id]; }
        else { $ret['observadores'] = []; }

        // ver empresas
        $ret['empresas'] = [];
        $postulaciones = $this->licitaciones_model->get_postulaciones($licitacion_id);

        foreach ($postulaciones as $postulacion) {
            if (in_array($postulacion->id_empresa, $sess['empresas'])) {
                $ret['empresas'][] = $postulacion->id_empresa;
            }
        }

        // identificar si hay un único perfil

        if ($ret['gobiernos'] == [] && $ret['observadores'] == [] && count($ret['empresas']) == 1) {
            $ret['profile'] = ['perfil'=>'empresa', 'id'=>$ret['empresas'][0]];
            $this->load->model('empresas_model');
            $empresa = $this->empresas_model->load($ret['empresas'][0]);
            $ret['profile']['nombre'] = $empresa->nombre;
        }
        else if ($ret['gobiernos'] == [] && count($ret['observadores']) == 1 && $ret['empresas'] == []) {
            $ret['profile'] = ['perfil'=>'observador', 'id'=>$ret['observadores'][0]];
            $this->load->model('observadores_model');
            $observador = $this->observadores_model->load($ret['observadores'][0]);
            $ret['profile']['nombre'] = $observador->nombre;
        }
        else if (count($ret['gobiernos']) == 1 && $ret['observadores'] == [] && $ret['empresas'] == []) {
            $ret['profile'] = ['perfil'=>'gobierno', 'id'=>$ret['gobiernos'][0]];
            $this->load->model('gov_model');
            $gov = $this->gov_model->load_by_id($ret['gobiernos'][0]);
            $ret['profile']['nombre'] = $gov->nombre;
        }
        else {
            $ret['profile'] = FALSE;    
        }

        return $ret;
    }

    public function CSRF() {
        $this->session->CSRF = $this->GUID();
        return $this->session->CSRF; 
    } 

    private function GUID(){
        if (function_exists('com_create_guid') === true){
            return trim(com_create_guid(), '{}');
            }

        return sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
    }

    /* validar si este usuario tiene el tipo y nombre del perfil validos 
    se usa para validar que las llamadas de chats no hayan sido modificadas */
    public function check_profile($licitacion_id, $perfil_tipo, $perfil_nombre){
        $profiles = $this->detect_licitacion_profiles($licitacion_id);
        if ($profiles['profile']['perfil'] != $perfil_tipo) return FALSE;
        if ($profiles['profile']['nombre'] != $perfil_nombre) return FALSE;
        return TRUE;
    } 

    /* Obtener a todos los usuarios del sistema */
    public function get_all(){
        $q = "SELECT id, nombre, login FROM usuario";
        $query = $this->db->query($q);
        return $query->result();
    }
}