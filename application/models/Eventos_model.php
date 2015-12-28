<?php

/**
Los eventos son sobre las licitaciones. Es información publica
que se verá en la web
*/
class Eventos_model extends CI_Model{

	/* Agregar una notificacion para un usuario especifico */
	public function add($licitacion_id, $titulo, $descripcion='', $url=''){
		$q = "INSERT INTO eventos 
	        (licitacion_id, titulo, descripcion) 
	        VALUES 
	        ($licitacion_id, '$titulo', '$descripcion');";
	    $query = $this->db->query($q);
        return $this->db->insert_id();
		}

	/* obtener las notificaciones de un usuario */
	public function get_from_licitacion($licitacion_id){
		$q = "SELECT * FROM eventos where licitacion_id=$licitacion_id order by id desc";
		$query = $this->db->query($q);
        return $query->result();
	}

}