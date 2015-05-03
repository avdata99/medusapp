<?php

class Empresas_model extends CI_Model {

    public function add($fields){
    	//validate
    	$errors = [];
    	if ($fields['razonsocial'] == '') {$errors[] = 'La razón soacial no puede estar vacia';}

    	//#TODO check for duplicated emails

    	if (count($error) > 0 ) {return array('result': FALSE, 'errors': $errors);}

    	$q = 'INSERT INTO empresa (nombre, status) 
    				VALUES ('.$fields['razonsocial'].', ' . EMPRESA_STATUS_NEW. '); ';
    	
        $query = $this->db->query($q);

        if ( !$query ) 
        	{return array('result': FALSE, 'errors': array("Error al insertar la empresa"));}

        return array('result': TRUE, 'errors': array());
    }
}