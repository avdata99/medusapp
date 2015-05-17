<?php

class Social_model extends CI_Model {

    public function all(){
    	$list = $this->db->get('social');
    	return $list->result();
    	}

    function load($social_name){
        $query = $this->db->query("SELECT * from social where social_name='$social_name'");

        return $query->row();
    }
}