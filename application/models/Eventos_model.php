<?php
class Eventos_model extends CI_Model{

	/* Agregar una notificacion para un usuario especifico */
	public function add($user_id, $titulo='', $descripcion='', $url=''){
		$q = "INSERT INTO eventos 
	        (user_id, titulo, descripcion, url, status) 
	        VALUES 
	        ($user_id, '$titulo', '$descripcion', '$url', 1);";
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