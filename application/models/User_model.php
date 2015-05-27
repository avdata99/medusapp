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
            $empresas[] = $empresas->id_empresa;
        }
        return $empresas;   
    }


    /**
    Ver si un usuario puede acceder a algo en particular
    id2 es el ID de empresa, gobierno, etc (no implementado)
    Hay que agregar funcionalidades para permisos especificos #TODO
    */
    public function can($permission, $id2 = 0){
        $sess = $this->session->all_userdata();
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
    Indicar si corresponde un where in para las listas de objetos de una clase
    Return False si no es necesario
    */
    public function getWhereIn($class){
        $sess = $this->session->all_userdata();
        if (in_array('FULL_ADMIN', $sess['roles'])) 
            return false;

        // el usuario que puede editar una licitacion es solo sobre los gobiernos a los que esta conectado
        // por lo tanto no uso class 'LICITACIONES', en estas uso GOVS
        if ($class == 'GOVS'){return $sess['govs_in'];}
    }
}