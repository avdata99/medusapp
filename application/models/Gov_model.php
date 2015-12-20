<?php

class Gov_model extends CI_Model
    {

    public function load($id){
        $q = "Select * from gobierno where id=$id";
        $query = $this->db->query($q);
        if ($query->num_rows() == 0) return FALSE;
        return $query->row();
    }
    
    function lista(){
    	$crud = new grocery_CRUD();
		$crud->set_table('gobierno');
		if (!$this->user_model->can('ADD_GOVS')) $crud->unset_add();
		if (!$this->user_model->can('EDIT_GOVS')) $crud->unset_edit();
		$crud->unset_delete();
		

		$crud_table = $crud->render();

    	}
    }