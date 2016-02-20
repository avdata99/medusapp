<?php

/**
Los eventos en el sistema que sean relevantes se procesan aquí
*/
class Hooks_model extends CI_Model{

	# ------------- LICITACIONES ----------------------
	function licitacion_before_insert($post){
		# Crear la URL slug solo la primera vez que se graba
		$post['uid'] = $this->helper_model->slugify($post['nombre']);
		
		$titulo = "Nueva licitación";
		$url = $this->config->item('app_url_web') . "/#licitacion/" . $post['uid'];
		$descripcion = "Se licita: " . $post['nombre']; 
		$this->notificaciones_model->addToAll($titulo, $descripcion, $url);

		return $post;
	}

	function licitacion_after_insert($post, $pk){
		# guardar el evento
		$this->eventos_model->add($pk, "Se creó la licitacion");
		return TRUE;
	}

	# ------------- GOVIERNOS 
	function gov_before_insert($post) {
		//crear el titulo slug
		$post['uid'] = $this->helper_model->slugify($post['nombre']);
		//marcar la fecha de alta
		$post['created_at'] = date('Y-m-d H:i:s');

		return $post;
	}

	function gov_after_insert($post, $pk) {
		$titulo = "Nuevo gobierno";
		$url = $this->config->item('app_url_web') . "/#gobierno/" . $post['uid'];
		$descripcion = "Se ha agregado " . $post['nombre'] . " a la plataforma MedusApp"; 
		$this->notificaciones_model->addToAll($titulo, $descripcion, $url);

		return TRUE;
	}

	# ------------- GOVIERNOS 
	function obs_before_insert($post) {
		//crear el titulo slug
		$post['uid'] = $this->helper_model->slugify($post['nombre']);
		//marcar la fecha de alta
		$post['created_at'] = date('Y-m-d H:i:s');

		return $post;
	}

	function obs_after_insert($post, $pk) {
		$titulo = "Nuevo observador";
		$url = $this->config->item('app_url_web') . "/#observador/" . $post['uid'];
		$descripcion = "Se ha agregado " . $post['nombre'] . " como observador a la plataforma MedusApp"; 
		$this->notificaciones_model->addToAll($titulo, $descripcion, $url);

		return TRUE;
	}

	/* alguien escribe en algun chat 
	se debe notificar (sin repetir y aumentando un contador)
	a los participantes de esa conversación
	*/
	function chat_after_insert($licitacion_salas_id) {
		$titulo = "Nuevo Chat";
		$this->load->model('salas_model');
		$sala = $this->salas_model->load_sala($licitacion_salas_id);
		$licitacion_id = $sala->licitacion_id;
		$this->load->model('licitaciones_model');
		$licitacion = $this->licitaciones_model->load_by_id($licitacion_id);

		$descripcion = "Chat en la sala " . 
			$sala->nombre . " de la licitacion " . 
			$licitacion->titulo;

		$url = $this->config->item('app_url_web') . "/home/sala/" . $licitacion->id;
		
		$licitacion = $this->salas_model->get_licitacion_from_sala($licitacion_salas_id);
		
		$this->notificaciones_model->addToLicitacion($licitacion_id, $titulo, $descripcion, $url);
	}

}

?>