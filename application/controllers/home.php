<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

	var $parts = array();

	public function __construct()
		{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');
		$this->load->library('grocery_CRUD');
		$this->parts['js_files'] = array(); // for grocery crud static files
		$this->parts['css_files'] = array(); // for grocery crud static files
		$this->parts['my_base_url'] = $this->config->item('base_url') . 'index.php/';
		
		}

	private function load_all(){
		if (!$this->session->userdata('user_id')) redirect($this->parts['my_base_url'].'home/show_login');
		$this->parts['session'] = $this->session->userdata;

		$this->parts['title'] = $this->config->item('app_name_short');
		$this->parts['headers'] = $this->load->view('headers.php', $this->parts, TRUE);
		$this->parts['menu_principal'] = $this->load->view('menu_principal.php', $this->parts, TRUE);
		$this->parts['notifications_bar'] = $this->load->view('notifications_bar.php', $this->parts, TRUE);
		$this->parts['navbar'] = $this->load->view('navbar.php', $this->parts, TRUE);
		$this->parts['js_loads'] = $this->load->view('js_loads.php', $this->parts, TRUE);
		$this->load->view('home.php', $this->parts);
	}

	public function login(){
		$this->user_model->login($this->input->post('user'), $this->input->post('password'));
		if ($this->session->userdata('user_id'))
			{
			redirect($this->parts['my_base_url'].'home/index');
			}
		else
			{
			$this->parts['title'] = 'PIN App login failed';
			$this->parts['error'] = "Acceso inválido";
			$this->load->view('login', $this->parts);
			}
	}

	public function logout(){
		$this->user_model->logout();
		$this->parts['title'] = 'PIN App Logout';
		$this->parts['error'] = "DESCONECTADO";
		$this->load->view('login', $this->parts);
	}

	public function show_login(){
		$this->parts['title'] = 'PIN App login';
		$this->load->view('login', $this->parts);
	}

	public function index(){
		$this->parts['active'] = 'inicio';
		$this->parts['title_table'] = 'Pactos de transparencia';
		$logo_junar = $this->config->item('base_url')."static/img/logo-junar-cuad.jpg";
		$logo_icda = $this->config->item('base_url')."static/img/Logo_ICDA_b.jpg";
		$logo_harvard = $this->config->item('base_url')."static/img/logo-hardvard-2.jpg";
		$style = "style='max-height:150px; padding:10px;'";

		$this->parts['table'] = "Sistema de Transparencia en Compras Públicas basado en Acuerdos Prácticos
			<br/>
			<img src='$logo_icda' $style/><img src='$logo_harvard' $style/><img src='$logo_junar' $style/>";
		$this->load_all();
	}

	public function licitaciones(){
		$this->parts['active'] = 'licitaciones';
		$this->parts['title_table'] = 'Licitaciones';
		
		$crud = new grocery_CRUD();
		$crud->set_table('licitacion');
		#TODO municipio_id is just for add time, not edit
		$crud->set_relation('gobierno_id', 'gobierno', '{nombre}');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		
		$this->load_all();
		
	}

	public function gobiernos(){
		$this->parts['active'] = 'gobiernos';
		$this->parts['title_table'] = 'Gobiernos';
		
		$crud = new grocery_CRUD();
		$crud->set_table('gobierno');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}


	public function empresas(){
		$this->parts['active'] = 'empresas';
		$this->parts['title_table'] = 'Empresas';
		
		$crud = new grocery_CRUD();
		$crud->set_table('empresa');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}


	public function observadores(){
		$this->parts['active'] = 'observadores';
		$this->parts['title_table'] = 'Observadores';
		
		$crud = new grocery_CRUD();
		$crud->set_table('observador');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}


	public function ciudadanos(){
		$this->parts['active'] = 'ciudadanos';
		$this->parts['title_table'] = 'Ciudadanos';
		
		$crud = new grocery_CRUD();
		$crud->set_table('ciudadano');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}

	public function usuarios(){
		$this->parts['active'] = 'usuarios';
		$this->parts['title_table'] = 'Usuarios';
		
		$crud = new grocery_CRUD();
		$crud->set_table('usuario');
		$crud->unset_columns('password');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}
}

