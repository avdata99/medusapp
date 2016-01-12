<?php

/**
Las notificaciones son mensajes que pueden ver los usuarios sobre acciones 
que pueden ser de su interes. 
*/
class Notificaciones_model extends CI_Model{

	/* Agregar una notificacion para un usuario especifico */
	public function add($user_id, $titulo='', $descripcion='', $url=''){
		$q = "INSERT INTO notificaciones 
	        (user_id, titulo, descripcion, url, status, fecha) 
	        VALUES 
	        ($user_id, '$titulo', '$descripcion', '$url', 1, '".date("Y-m-d H:i:s")."');";
	    $query = $this->db->query($q);
        return $this->db->insert_id();
		}

	/* obtener las notificaciones de un usuario */
	public function get_from_user($user_id){
		$q = "SELECT * FROM notificaciones where user_id=$user_id order by id desc";
		$query = $this->db->query($q);
        return $query->result();
	}

	/* agregar una notificacion para todos los usuarios de un gobierno */
	public function addToGov($gobierno_id, $titulo='', $descripcion='', $url=''){
		$this->load->model('gov_model');
		$users = $this->gov_model->get_users($gobierno_id);
		$res = [];
		foreach ($users as $user) {
			$res[]= $this->add($user->id_usuario, $titulo, $descripcion, $url);
		}
		return $res;
	}

	/* agregar una notificacion para todos los usuarios de una empresa */
	public function addToEmp($empresa_id, $titulo='', $descripcion='', $url=''){
		$this->load->model('empresas_model');
		$users = $this->empresas_model->get_users($empresa_id);
		$res = [];
		foreach ($users as $user) {
			$res[]= $this->add($user->id_usuario, $titulo, $descripcion, $url);
		}
		return $res;
	}

	/* agregar una notificacion para todos los usuarios de un observador */
	public function addToObs($observador_id, $titulo='', $descripcion='', $url=''){
		$this->load->model('observadores_model');
		$users = $this->observadores_model->get_users($observador_id);
		$res = [];
		foreach ($users as $user) {
			$res[]= $this->add($user->id_usuario, $titulo, $descripcion, $url);
		}
		return $res;
	}

	/* agregar una notificacion para todos los usuarios del sistema */
	public function addToAll($titulo='', $descripcion='', $url=''){
		$this->load->model('observadores_model');
		$users = $this->user_model->get_all();
		$res = [];
		foreach ($users as $user) {
			$res[]= $this->add($user->id, $titulo, $descripcion, $url);
		}
		return $res;
	}
	
}