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
		$this->parts['my_base_url'] = $this->config->item('base_url');
		
		}

	private function load_all(){
		if (!$this->session->userdata('user_id')) $this->redirecToLogin();
		$this->parts['session'] = $this->session->userdata;

		$this->parts['title'] = $this->config->item('app_name_short');
		if (isset($this->parts['subtitle'])) $this->parts['title'] = $this->parts['title'] . ' - ' . $this->parts['subtitle'];
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
		$this->parts['title'] = $this->config->item('app_name_short') . ' Logout';
		$this->parts['error'] = "DESCONECTADO";
		$this->load->view('login', $this->parts);
	}

	public function show_login(){
		$this->parts['title'] = $this->config->item('app_name_short') . ' login';
		$this->parts['error'] = '';
		$this->load->view('login', $this->parts);
	}

	public function index(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		$this->parts['active'] = 'inicio';
		$this->parts['title_table'] = 'Pactos de transparencia';
		$logo_junar = $this->config->item('base_url')."static/img/logo-junar-cuad.jpg";
		$logo_icda = $this->config->item('base_url')."static/img/Logo_ICDA_b.jpg";
		$logo_harvard = $this->config->item('base_url')."static/img/logo-hardvard-2.jpg";
		$style = "style='max-height:150px; padding:10px;'";

		$this->parts['subtitle'] = 'Home';
		$this->parts['table'] = "Sistema de Transparencia en Compras Públicas basado en Acuerdos Prácticos<br/>";
		$this->parts['table'] .= "<img src='$logo_icda' $style/><img src='$logo_harvard' $style/>";
		# $this->parts['table'] += "<img src='$logo_junar' $style/>";
		$this->load_all();
	}

	public function redirecToLogin(){
		redirect($this->parts['my_base_url'].'home/show_login');
	}

	public function redirecToUnauthorized(){
		redirect($this->parts['my_base_url'].'home/unauthorized');
	}

	public function unauthorized(){
		$this->parts['active'] = 'No autorizado';
		$this->parts['title_table'] = 'No autorizado';
		$this->parts['table'] = 'No tiene permiso para ingresar a esta seccion';
		if (ENVIRONMENT == 'development'){
			$sess = $this->session->all_userdata();
			$this->parts['table'] .= '<hr><pre>' . print_r($sess, TRUE) . '</pre>';}
		
		$this->load_all();
	}

	/* una empresa se postula a una licitacion */
	public function postularse($licitacion_id){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('ADD_POSTULACIONES'))
			{$this->redirecToUnauthorized();}
		if (!$this->user_model->hasRole('EMP_ADMIN')){
			{$this->redirecToUnauthorized();}
		}
		$this->parts['active'] = 'licitaciones';
		#TODO si el usuario representa a mas de una empresa, preguntar a nombre de
		# cual hace esto
		$empresas = $this->user_model->empresas();
		if (count($empresas) == 0) {
			$this->parts['subtitle'] = 'Error al postularse';
			$this->parts['title_table'] = 'Fallo postulación';
			$this->parts['table'] = "Tu usuario no tiene empresa asignada para postularse";
		}
		elseif (count($empresas) > 1) {
			$this->parts['subtitle'] = 'Error al postularse';
			$this->parts['title_table'] = 'Fallo postulación';
			$this->parts['table'] = "Tu usuario tiene más de una empresa asignada";
		}
		else {
			$empresa_id= $empresas[0];
			$this->load->model('postulaciones_model');
			$postulacion_id = $this->postulaciones_model->add($licitacion_id, $empresa_id);
			$this->parts['subtitle'] = 'Licitaciones';
			
				
			if ($postulacion_id){
				$this->parts['title_table'] = 'Postulación correcta';
				$this->parts['table'] = $this->load->view('postularse.php', $this->parts, TRUE);
			}
			else {
				$this->parts['title_table'] = 'Postulación INCORRECTA';
				$this->parts['table'] = "Error al postularse, posiblementa ya estas postulado a esta licitacion";
			}
			
		}
		$this->load_all();
	}

	private function show_error($title, $description=''){
		$this->parts['subtitle'] = '';
		$this->parts['title_table'] = $title;
		$this->parts['table'] = $description;
		$this->parts['active'] = '';
		$this->load_all();
	}

	/* empresa cargando los datos de la licitacion
	Si no se pasa la empresa supongo una sola */
	public function procesar_licitacion($licitacion_id, $empresa_id){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_LICITACION') && !$this->user_model->can('EDIT_LICITACION'))
			{$this->redirecToUnauthorized();}
		
		// ver que la empresa haya postulado y haya sido aceptado
		$empresas = $this->user_model->empresas();
		if (!in_array($empresa_id, $empresas)) {
			$this->show_error('Error al procesar licitacion', 'Tu usuario no tiene permisos para la empresa');
			return False;
		}

		$this->load->model('postulaciones_model');
		$res = $this->postulaciones_model->validate($licitacion_id, $empresa_id);
		if (!$res->status){
			$this->show_error('Error al procesar licitacion', 'No puedes acceder a esta licitacion');
			return False;
		}

		//revisar que todos los pedidos tengan al menos un registro de entregado
		//vacio en espera de carga
		$dbg = $this->postulaciones_model->check_documents($licitacion_id);
		$this->parts['debug'] = print_r($dbg, TRUE);

		$this->parts['title'] = 'Procesar postulacion';
		$this->parts['subtitle'] = 'Procesar postulacion';
		$this->parts['title_table'] = 'Licitacion: ' . $res->results['licitacion'];
		$this->parts['active'] = 'licitaciones';

		// cargar la tabla de datos pedidos para la licitacion con el de datos ya enregados
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');

		$crud->set_model('my_custom_grocery_entregados_model');
		$crud->set_table('licitacion_datos_entregados');
		
		/* BEST QUERY */
		$q = "SELECT lde.id, lde.url
		 , ldes.estado
		 , empresa.nombre AS empresa
		 , ldp.id AS pedido_id
		 , dp.titulo as documento

		 FROM licitacion_datos_entregados AS lde
		LEFT JOIN licitacion_datos_entregados_status as ldes ON ldes.id = lde.status
		LEFT JOIN empresa ON empresa.id = lde.id_empresa
		LEFT JOIN licitacion_datos_pedidos as ldp ON ldp.id = lde.id_licitacion_dato_pedido
		LEFT JOIN datos_publicar as dp ON dp.id=ldp.id_dato_pedido
		WHERE id_empresa = $empresa_id AND ldp.id_licitacion=$licitacion_id";
		
		$crud->basic_model->set_manual_select($q);
		$crud->columns('documento', 'empresa', 'estado', 'url');
		$crud->edit_fields('url');
		/*
		$crud->set_relation('status', 'licitacion_datos_entregados_status', 'estado'); 
		$crud->set_relation('id_empresa', 'empresa', 'nombre'); 
		
		$crud->set_relation('id_licitacion_dato_pedido', 'licitacion_datos_pedidos', 'id');  
		// $crud->set_relation('id_dato_pedido', 'datos_publicar', 'titulo');  
		
		
		$crud->set_relation_n_n('Documento', 'licitacion_datos_pedidos' 
				, 'datos_publicar'
				, 'id' // pega contra el primary key de la tabla princiapl de ste CRUD ¿?
				// conecta con: `{$this->table_name}`.$this_table_primary_key 
				, 'id_dato_pedido'
				, 'titulo'
				,''
				,['licitacion_datos_entregados.id_datos_pedidos'=>'licitacion_datos_pedidos.id']);
		
		$crud->where("id_empresa = $empresa_id");
		*/

		$crud->set_field_upload('url',$this->config->item('upload_documentos_empresas'));
		
		$crud->unset_read();
		$crud->unset_add();
		// $crud->unset_edit();
		$crud->unset_delete();
		
		//$crud->change_field_type('id_licitacion_dato_pedido', 'invisible');
		// $crud->field_type('id_licitacion_dato_pedido', 'hidden');
		// $crud->unset_columns('id_licitacion_dato_pedido');
		// $crud->callback_before_insert(array($this,'_slug_title')); # solo en el insert, la primera vez
		// $crud->columns('nombre', 'gobierno_id', 'observador_id');
		// $crud->display_as('id_empresa','Empresa');
		
		$crud_table = $crud->render();
		$data = ['results'=>$res->results];
		$this->parts['table_pre'] = $this->load->view('procesar_licitacion', $data, TRUE);
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();

	}
	public function define_upload_company_document($primary_key, $row){
		$upload = '/home/upload_company_document/';
		return $upload . $primary_key . '/'. $this->tmp['empresa_id'];
	}
	/* ver el listado de licitaciones*/
	public function licitaciones(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_LICITACION'))
			{$this->redirecToUnauthorized();}

		$this->parts['subtitle'] = 'Licitaciones';
		$this->parts['active'] = 'licitaciones';
		$this->parts['title_table'] = 'Licitaciones';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('licitacion');
		#TODO municipio_id is just for add time, not edit
		// uso govs porque un usuario puede ver las licitaciones sobre las que tiene permisos
		$where_in = $this->user_model->getWhereIn('GOVS'); 
		if ($where_in){
			$crud->where("gobierno_id in ($where_in)");
			// solo mostrar en la lista los minicipios que tengo permisos (para que no cree licitaciones a nombre de otros municipios)
			$wh = "gobierno.id in ($where_in)"; // este texto es para el sql de listar la tabla anexa
			}
		else {
			$wh = null; // no filtrar la lista a elegit
		}
		$crud->set_relation('gobierno_id', 'gobierno', 'nombre', $wh, 'gobierno.nombre'); 

		# no mostrar el observador designbado o permitir cargarlo a los no administradores
		if (!$this->user_model->can('CHANGE_OBSS_LICITACION')) { # no a real role, just for FULL-ADMIN 
			$crud->field_type('observador_id', 'hidden');
			$crud->unset_columns('observador_id');
			}
		else {
			$crud->set_relation('observador_id','observador','nombre');
			}

		$crud->set_relation_n_n('datos', 'licitacion_datos_pedidos', 'datos_publicar', 
			'id_licitacion', 'id_dato_pedido', 'titulo' );
		$crud->set_field_upload('documento',$this->config->item('upload_documents'));
		$crud->set_field_upload('imagen',$this->config->item('upload_images'));
		if (!$this->user_model->can('ADD_LICITACION')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_LICITACION')) $crud->unset_edit();
		$crud->unset_delete();
		$crud->change_field_type('uid','invisible');
		$crud->callback_before_insert(array($this,'_slug_title')); # solo en el insert, la primera vez
		$crud->columns('nombre', 'gobierno_id', 'observador_id');
		$crud->display_as('gobierno_id','Gobierno');
		$crud->display_as('observador_id','Observador');
		$crud->display_as('datos','Datos a solicitar a las empresas');

		# si es una empresa agregar la opcion de postularse
		if ($this->user_model->hasRole('EMP_ADMIN') && $this->user_model->can('ADD_POSTULACIONES')){
			$img = ''; # 'http://www.grocerycrud.com/assets/uploads/general/smiley.png';
			$class = ''; # 'ui-icon-plus';
			$crud->add_action('Postularse', $img, '/home/postularse', $class);
		}

		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		
		$this->load_all();
		
	}

	/** Crear la URL slug solo la primera vez que se graba */
	public function _slug_title($post){

		$post['uid'] = $this->slugify($post['nombre']);
		 
		return $post;
	}

	function slugify($string, $replace = array(), $delimiter = '-') {
	  // https://github.com/phalcon/incubator/blob/master/Library/Phalcon/Utils/Slug.php
	  if (!extension_loaded('iconv')) {
	    throw new Exception('iconv module not loaded');
	  }
	  // Save the old locale and set the new locale to UTF-8
	  $oldLocale = setlocale(LC_ALL, '0');
	  setlocale(LC_ALL, 'en_US.UTF-8');
	  $clean = iconv('UTF-8', 'ASCII//TRANSLIT', $string);
	  if (!empty($replace)) {
	    $clean = str_replace((array) $replace, ' ', $clean);
	  }
	  $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
	  $clean = strtolower($clean);
	  $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);
	  $clean = trim($clean, $delimiter);
	  // Revert back to the old locale
	  setlocale(LC_ALL, $oldLocale);
	  return $clean;
	}

	public function gobiernos(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_GOVS'))
			{$this->redirecToUnauthorized();}
		$this->parts['subtitle'] = 'Gobiernos';
		$this->parts['active'] = 'gobiernos';
		$this->parts['title_table'] = 'Gobiernos';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');

		$crud->set_table('gobierno');
		if (!$this->user_model->can('ADD_GOVS')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_GOVS')) $crud->unset_edit();
		$crud->unset_delete();

		# mostrar solo los gobiernos a los que el usuario tiene permiso
		$where_in = $this->user_model->getWhereIn('GOVS');
		if ($where_in){
			$crud->where("id in ($where_in)");
		}

		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}

	/** Postulaciones de empresas a licitaciones */
	public function postulaciones(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_POSTULACIONES'))
			{$this->redirecToUnauthorized();}

		$this->parts['subtitle'] = 'Postulaciones';
		$this->parts['active'] = 'postulaciones';
		$this->parts['title_table'] = 'Postulaciones';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('licitacion_postulaciones');
		#TODO municipio_id is just for add time, not edit
		$crud->set_relation('id_licitacion', 'licitacion', 'nombre');
		$crud->set_relation('id_empresa','empresa','nombre');
		$crud->set_relation('status', 'licitacion_postulacion_status', 'estado');
		//agregar o editar postulaciones desde la lista es cuestion de administradores
		if (!$this->user_model->hasRole('FULL_ADMIN')) {
			$crud->unset_add();	
			$crud->unset_edit();
		}
		// if (!$this->user_model->can('ADD_POSTULACIONES')) $crud->unset_add();
		// if (!$this->user_model->can('EDIT_POSTULACIONES')) $crud->unset_edit();
		$crud->unset_delete();
		// uso govs porque un usuario puede ver las licitaciones sobre las que tiene permisos
		$where_in = $this->user_model->getWhereIn('GOVS'); 
		if ($where_in){
			$crud->where("licitacion.gobierno_id in ($where_in)"); #TODO check this
		}
		$where_in = $this->user_model->getWhereIn('EMPS'); 
		if ($where_in){
			$crud->where("id_empresa in ($where_in)"); #TODO check this
		}
		$crud->display_as('id_licitacion','Licitacion');
		$crud->display_as('id_empresa','Empresa');
		
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		
		$this->load_all();
			
	}

	public function textos(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('EDIT_WEBPAGE')) # no existe el permiso por lo tanto solo full admin podra
			{$this->redirecToUnauthorized();}

		$this->parts['active'] = 'textos';
		$this->parts['title_table'] = 'Textos Web';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('textos');
		if (!$this->user_model->can('EDIT_WEBPAGE')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_WEBPAGE')) $crud->unset_edit();
		$crud->unset_delete();
		$crud->unset_columns('code');
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}

	public function empresas(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_EMPRESAS'))
			{$this->redirecToUnauthorized();}

		$this->parts['subtitle'] = 'Empresas';
		$this->parts['active'] = 'empresas';
		$this->parts['title_table'] = 'Empresas';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('empresa');
		if (!$this->user_model->can('ADD_EMPS')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_EMPS')) $crud->unset_edit();
		# limitar la lista a los usuarios permitidos
		$where_in = $this->user_model->getWhereIn('EMPS'); 
		if ($where_in){
			$crud->where("empresa.id in ($where_in)");
		}
		# mostrar y permitir cambiar el estado de las empresas solo a los usuarios autorizados
		if (!$this->user_model->can('CHANGE_STATUS_EMPS')) { # no a real role, just for FULL-ADMIN 
			$crud->field_type('status', 'hidden');
			$crud->unset_columns('status');
			}
		else {
			$crud->set_relation('status', 'empresa_status', 'estado');
			}
		
		$crud->unset_delete();
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}


	public function observadores(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_OBSERVADORES'))
			{$this->redirecToUnauthorized();}

		$this->parts['subtitle'] = 'Observadores';
		$this->parts['active'] = 'observadores';
		$this->parts['title_table'] = 'Observadores';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('observador');
		$crud->unset_delete();
		if (!$this->user_model->can('ADD_OBSS')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_OBSS')) $crud->unset_edit();
		
		# limitar la lista a los observadores sobre los cuales hay permiso
		$where_in = $this->user_model->getWhereIn('OBSS'); 
		if ($where_in){
			$crud->where("observador.id in ($where_in)");
		}
		
		# mostrar y permitir cambiar el estado de los observadores solo cuando este permitido
		if (!$this->user_model->can('CHANGE_STATUS_OBSS')) { # no a real role, just for FULL-ADMIN 
			$crud->field_type('status', 'hidden');
			$crud->unset_columns('status');
			}
		else {
			$crud->set_relation('status', 'observador_status', 'estado');
			}
		
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}


	public function ciudadanos(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_CIUDADANOS'))
			{$this->redirecToUnauthorized();}
		
		$this->parts['subtitle'] = 'Ciudadanos';
		$this->parts['active'] = 'ciudadanos';
		$this->parts['title_table'] = 'Ciudadanos';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('ciudadano');
		$crud->unset_delete();
		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}

	public function usuarios(){
		if (ENVIRONMENT == 'development') $this->output->enable_profiler(TRUE);
		if (!$this->user_model->can('VIEW_USUARIOS'))
			{$this->redirecToUnauthorized();}
		
		$this->parts['subtitle'] = 'Usuarios';
		$this->parts['active'] = 'usuarios';
		$this->parts['title_table'] = 'Usuarios';
		
		$crud = new grocery_CRUD();
		$crud->set_theme('bootstrap');
		$crud->set_table('usuario');
		
		$crud->unset_columns('password');
		$crud->unset_delete();
		$crud->change_field_type('password', 'password');
		# para evitar que se aplique MD5 sobre algo que ya lo es
		$crud->callback_edit_field('password',array($this,'set_password_input_to_empty'));
    	$crud->callback_add_field('password',array($this,'set_password_input_to_empty'));
 
		$crud->callback_before_insert(array($this,'encrypt_password_callback'));
		$crud->callback_before_update(array($this,'encrypt_password_callback'));
		
		$crud->set_relation_n_n('Gobiernos',    'usuario_gobiernos',    'gobierno',   'id_usuario', 'id_gobierno',   'nombre');
		$crud->set_relation_n_n('Empresas',     'usuario_empresas',     'empresa',    'id_usuario', 'id_empresa',    'nombre');
		$crud->set_relation_n_n('Observadores', 'usuario_observadores', 'observador', 'id_usuario', 'id_observador', 'nombre');
		$crud->set_relation_n_n('Roles', 		'usuario_rol', 			'rol', 		  'id_usuario', 'id_rol', 		 'nombre');

		$crud_table = $crud->render();
		$this->parts['table'] = $crud_table->output;
		$this->parts['css_files'] = $crud_table->css_files;
		$this->parts['js_files'] = $crud_table->js_files;
		$this->load_all();	
	}

	public function encrypt_password_callback($post){
		if ($post['password'] != '') $post['password'] = md5($post['password']);
		else unset($post['password']);
		return $post;
	}

	function set_password_input_to_empty() {
	    return "<input type='password' name='password' value='' />";
	}
}

