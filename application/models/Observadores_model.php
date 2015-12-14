<?php

class Observadores_model extends CI_Model
    {

    public function load($id){
        $q = "Select * from observador where id=$id";
        $query = $this->db->query($q);
        if ($query->num_rows() == 0) return FALSE;
        return $query->row();
    }
    
    }