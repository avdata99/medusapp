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

class Empresas extends REST_Controller{
	public function registrar_post(){
		$this->load->model('empresas_model');
		$ret = $this->empresas_model->add($this->input->post());
		if ($ret['result']){
			$this->response($ret, 200);
		}
		else {
			$this->response(array('result': FALSE, 'errors' => array('General Error')), 200);
		}
	}
}