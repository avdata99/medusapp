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
        $sess['permission'] = $this->readPermissions($res->id);

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
    }