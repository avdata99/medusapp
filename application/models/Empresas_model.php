<?php

class Empresas_model extends CI_Model {
    
    public function load($id){
        $q = "Select * from empresa where id=$id";
        $query = $this->db->query($q);
        if ($query->num_rows() == 0) return FALSE;
        return $query->row();
    }

    public function add($fields){
    	//validate
    	$errors = [];
    	if ($fields['razonsocial'] == '') {$errors[] = 'La razón social no puede estar vacia';}
        if ($fields['cuit'] == '') {$errors[] = 'El CUIT no puede estar vacio';}
        if ($fields['email'] == '') {$errors[] = 'El email no puede estar vacia';}


    	//#TODO check for duplicated emails

    	if (count($errors) > 0 ) {return array('result'=> FALSE, 'errors'=> $errors);}

    	$q = 'INSERT INTO empresa (nombre, status, cuit, email, responsable_nombre, responsable_apellido, pais) 
    				VALUES ("'.$fields['razonsocial'].'", 1, 
                        "'.$fields['cuit'].'","'.$fields['email'].'",
                        "'.$fields['nombre'].'","'.$fields['apellido'].'","'.$fields['pais'].'"); ';

    	
        $query = $this->db->query($q);

        if ( !$query ) 
        	{
            $txt = "Error al grabar empresa [$q]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return array('result'=> FALSE, 'errors'=> array("Error al insertar la empresa"));
            }

        return array('result'=> TRUE, 'errors'=> array());
    }

    /* obtener la lista de usuarios de un gobierno */
    public function get_users($empresa_id){
        $q = "Select id_usuario from usuario_empresas where id_empresa=$empresa_id";
        $query = $this->db->query($q);
        return $query->result();
    }
}