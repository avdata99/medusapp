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
        #TODO set role and permissions
        $sess['permission'] = array();
        $this->session->set_userdata($sess);
        return true;

        }

        function logout(){
            $sess = array('user_name'=>'', 'user_login'=>'', 'user_id'=>0);
            $this->session->set_userdata($sess);
        }

    }