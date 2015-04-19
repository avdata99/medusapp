<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Licitacion extends CI_Controller {
	function ver($licitacion_name){
		$this->load->model('licitaciones_model');
		$licitacion = $this->licitaciones_model->load($licitacion_name);
		echo "viendo <pre>" . print_r($licitacion, TRUE) . "</pre>";
	}
}