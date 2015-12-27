<?php
class Notificaciones_model extends CI_Model{

	/* Agregar una notificacion para un usuario especifico */
	public function add($user_id, $titulo='', $descripcion='', $url=''){
		$txt = addslashes($txt);
	        $q = "INSERT INTO notificaciones 
	        (user_id, titulo, descripcion, url) 
	        VALUES 
	        ($user_id, '$titulo', '$descripcion', '$url');";

	        return $this->db->insert_id();
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

	/* agregar una notificacion para todos los usuarios de una empresa */
	public function addToObs($observador_id, $titulo='', $descripcion='', $url=''){
		$this->load->model('observadores_model');
		$users = $this->observadores_model->get_users($observador_id);
		$res = [];
		foreach ($users as $user) {
			$res[]= $this->add($user->id_usuario, $titulo, $descripcion, $url);
		}
		return $res;
	}

	
}