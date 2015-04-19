<?php

class Textos_model extends CI_Model {

    public function all(){
    	$list = $this->db->get('textos');
    	return $list->result();
    	}

    function load($code){
        $query = $this->db->query("SELECT descripcion, texto from textos where code='$code'");

        return $query->row();
    }
}