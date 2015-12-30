<?php

/**
Los eventos en el sistema que sean relevantes se procesan aquí
*/
class Hooks_model extends CI_Model{

	# ------------- LICITACIONES ----------------------
	function licitacion_before_inter($post){
		# Crear la URL slug solo la primera vez que se graba
		$post['uid'] = $this->slugify($post['nombre']);
		return $post;
	}

	function licitacion_after_inter($post, $pk){
		# guardar el evento
		$this->eventos_model->add($pk, "Se creó la licitacion");
		return TRUE;
	}

	# ------------- GOVIERNOS 
	function gov_before_insert($post) {
		//crear el titulo slug
		$this->load->model('helper_model');
		$post['uid'] = $this->helper_model->slugify($post['nombre']);
		//marcar la fecha de alta
		$post['created_at'] = date('Y-m-d H:i:s');

		return $post;
	}

	function gov_after_insert($post, $pk) {
		$titulo = "Nuevo gobierno";
		$url = "http://medusapp.org/#gobierno/" . $post['uid'];
		$descripcion = "Se ha agregado " . $post['nombre'] . " a la plataforma MedusApp"; 
		$this->notificaciones_model->addToAll($titulo, $descripcion, $url);

		return TRUE;
	}

}

?>