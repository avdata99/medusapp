<?php

class Licitaciones_model extends CI_Model {

    public function all(){
    	$list = $this->db->get('licitacion');
    	return $list->result();
    	}

    public function lista(){
    	$query = $this->db->query("SELECT g.nombre gobierno, li.nombre titulo, 
    			li.detalle descripcion, li.documento, li.fecha_inicio, li.fecha_fin 
				FROM licitacion li
				join gobierno g on li.gobierno_id=g.id
				order by fecha_inicio");

    	return $query->result();

    }
}