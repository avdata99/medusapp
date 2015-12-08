<?php
/**
Custom grocery para las consultas completas de obtencion de status y lista de documentos
entregados para la licitacion
*/
class My_custom_grocery_entregados_model extends grocery_CRUD_Model  {

    protected $manual_select = null;

    function __construct(){
        parent::__construct();
        }

	function set_manual_select($q){
		$this->manual_select = $q;
	}

	function get_list(){
        // echo "MANUAL SELECT -> (" . $this->manual_select . ")";
        $results = $this->db->query($this->manual_select)->result();
        return $results;
    	}

	function get_total_results(){
        return $this->db->query($this->manual_select)->num_rows();
    	}

}