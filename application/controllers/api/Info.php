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

class Info extends REST_Controller{
	public function load_get($code){
		$this->load->model('textos_model');
		$texto = $this->textos_model->load($code);

		if($texto)
        	{$this->response($texto, 200);}
        else
        	{$this->response(array('error' => 'Error'), 404);}
	}
}