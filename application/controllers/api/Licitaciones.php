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
        	{$this->response($lic, 200);}
        else
        	{$this->response(array('error' => 'Error'), 404);}
	}

    public function load_get($uid){
        $this->load->model('licitaciones_model');
        $lic = $this->licitaciones_model->load($uid);

        if($lic)
            {$this->response($lic, 200);}
        else
            {$this->response(array('error' => 'Error'), 404);}
    }

    public function postulaciones_get($uid){
        $this->load->model('licitaciones_model');
        $lic = $this->licitaciones_model->load($uid);
        $licitacion_id = $lic->id;
        $postulaciones = $this->licitaciones_model->get_postulaciones($licitacion_id);
        
        if($lic)
            {$this->response($postulaciones, 200);}
        else
            {$this->response(array('error' => 'Error'), 404);}
    }
}