<?php

class Licitaciones_model extends CI_Model
    {
    public function all(){
    	$list = $this->db->get('licitacion');
    	return $list->result();
    	}
    }