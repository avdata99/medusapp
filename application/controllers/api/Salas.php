<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Example
 *
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array.
 *
 * @package		CodeIgniter
 * @subpackage	Rest Server
 * @category	Controller
 * @author		Phil Sturgeon
 * @link		http://philsturgeon.co.uk/code/
*/

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class Salas extends REST_Controller{
	public function mensaje_post(){
		$post = $this->input->post();
		if ($post['CSRF'] != $this->session->CSRF) {
			$this->response(['result'=> FALSE,] , 403);	
		}
		$this->load->model('salas_model');
		$licitacion_salas_id = $post['sala_id'];
		$user_id = $this->session->userdata('user_id');
		$mensaje = $post['mensaje'];
		$perfil_tipo = 'tipo';
		$perfil_nombre = 'nombre test';
		$chat_msg_id = $this->salas_model->add_chat($licitacion_salas_id, $user_id, $mensaje, $perfil_tipo, $perfil_nombre);
		$this->response(['result'=> TRUE, 'id'=>$chat_msg_id] , 200);
	}
}