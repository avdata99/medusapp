<?php
class Errors_model extends CI_Model{

public function add($txt, $seccion='', $relevance=3){
	$txt = addslashes($txt);
        $seccion = addslashes($seccion);
        
        $ahora = date("Y-m-d H:i:s");
        $usuario = $this->session->userdata('user_id');
        $q = "insert into errores (seccion,usuario,error,fecha,relevance) VALUES ";
        $q .= "('$seccion', '$usuario','$txt','$ahora',$relevance)";

        return $this->db->query($q);
	}
	
}