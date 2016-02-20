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
	public function get_from_user($user_id, $limit=10){
		$q = "SELECT * FROM notificaciones where user_id=$user_id order by id desc limit $limit";
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

	/* enviar una notificacion a todos los que estén en una licitacion 
	 gobierno, observador y usuarios de empresas */
	public function addToLicitacion($licitacion_id, $titulo='', $descripcion='', $url=''){
		$this->load->model('licitaciones_model');
		
		$licitacion = $this->licitaciones_model->load_by_id($licitacion_id);

		$observador_id = $licitacion->observador_id;
		$this->addToObs($observador_id, $titulo, $descripcion, $url);
		
		$gobierno_id = $licitacion->gobierno_id;
		$this->addToGov($gobierno_id, $titulo, $descripcion, $url);
		
		// empresas que se postularton y fueron aceptadas
		$postulaciones = $this->licitaciones_model->get_postulaciones($licitacion_id);
		
		foreach ($postulaciones as $postulacion) {
			$empresa_id = $postulacion->id_empresa;
			$this->addToEmp($empresa_id, $titulo, $descripcion, $url);
		}
		return TRUE;
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