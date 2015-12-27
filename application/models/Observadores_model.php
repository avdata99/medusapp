<?php

class Observadores_model extends CI_Model
    {

    public function load($id){
        $q = "Select * from observador where id=$id";
        $query = $this->db->query($q);
        if ($query->num_rows() == 0) return FALSE;
        return $query->row();
    }

    /* obtener la lista de usuarios de un gobierno */
    public function get_users($observador_id){
        $q = "Select id_usuario from usuario_observadores where id_observador=$observador_id";
        $query = $this->db->query($q);
        return $query->result();
    }
    
}