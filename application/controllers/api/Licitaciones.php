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

class Licitaciones extends REST_Controller{
	public function index_get(){
		$this->load->model('licitaciones_model');
		$lic = $this->licitaciones_model->lista();

		if($lic)
        	{
            $this->response($lic, 200); // 200 being the HTTP response code
        	}
        else
        	{
            $this->response(array('error' => 'Error'), 404);
        	}
	}
}