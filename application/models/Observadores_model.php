<?php

class Observadores_model extends CI_Model
    {

    public function load_by_id($id){
        $q = "Select o.*, p.pais from observador o 
                join pais p on o.pais_id=p.id
                where o.id=$id";
        $query = $this->db->query($q);
        if ($query->num_rows() == 0) return FALSE;
        return $query->row();
    }

    public function load($uid){
        $q = "Select o.*, p.pais from observador o 
                join pais p on o.pais_id=p.id
                where uid='$uid'";
        $query = $this->db->query($q);
        $observador = $query->row();
        $ret = ['observador'=>$observador];
        $this->load->model('licitaciones_model');
        $ret['licitaciones'] = $this->licitaciones_model->lista(FALSE, [], [$observador->id]);

        return $ret;
    }

    /* obtener la lista de usuarios de un gobierno */
    public function get_users($observador_id){
        $q = "Select id_usuario from usuario_observadores where id_observador=$observador_id";
        $query = $this->db->query($q);
        return $query->result();
    }

    public function lista(){
        $q = "Select o.*, p.pais from observador o
                join pais p on o.pais_id=p.id";

        $query = $this->db->query($q);

        return $query->result();

    }
    
}