<?php

class Gov_model extends CI_Model
    {
    function list(){
    	$crud = new grocery_CRUD();
		$crud->set_table('gobierno');
		if (!$this->user_model->can('ADD_GOVS')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_GOVS')) $crud->unset_edit();
		$crud->unset_delete();
		

		$crud_table = $crud->render();

    	}
    }