<?php

class Gov_model extends CI_Model
    {

    public function load($uid){
        $q = "Select g.*, p.pais from gobierno g
                join pais p on g.pais_id=p.id
                where g.uid='$uid'";
        $query = $this->db->query($q);
        $gobierno = $query->row();
        $ret = ['gobierno'=>$gobierno];
        $this->load->model('licitaciones_model');
        $ret['licitaciones'] = $this->licitaciones_model->lista(FALSE, [$gobierno->id]);
        return $ret;
    }

    public function load_by_id($id){
        $q = "Select g.*, p.pais from gobierno g
                join pais p on g.pais_id=p.id
                where g.uid=$id";
        $query = $this->db->query($q);
        
        $gobierno = $query->row();
        $ret = ['gobierno'=>$gobierno];

        return $ret;
    }

    /* obtener la lista de usuarios de un gobierno */
    public function get_users($gobierno_id){
        $q = "Select id_usuario from usuario_gobiernos where id_gobierno=$gobierno_id";
        $query = $this->db->query($q);
        return $query->result();
    }

    public function lista(){
        $q = "Select g.*, p.pais from gobierno g
                join pais p on g.pais_id=p.id";

        $query = $this->db->query($q);

        return $query->result();

    }

}
    
    