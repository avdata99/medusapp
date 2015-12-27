<?php

class Licitaciones_model extends CI_Model {

    public function all(){
    	$list = $this->db->get('licitacion');
    	return $list->result();
    	}

    public function lista($soloActivas=FALSE, $gobiernos=[]){
        /* 
        soloActivas se refiere a la fecha de inicio y cierre 
        gobiernos es una lista de IDs
        */
        $filtros = [];
        if (count($gobiernos) > 0){
            $gobs = implode(',', $gobiernos);
            $filtros[] = 'gobierno_id IN ('.$gobs.')';
        }
        if ($soloActivas){
            $ahora = date("Y-m-d H:i:s");
            $filtros[] = "fecha_inicio>='$ahora' AND fecha_fin <='$ahora'";
        }

        $where = (count($filtros) == 0) ? '' : ' WHERE ' . implode(' AND ', $filtros). ' ';
    	$query = $this->db->query("SELECT g.nombre gobierno, li.uid, li.nombre titulo, 
    			li.detalle descripcion, li.documento, li.imagen, li.fecha_inicio, li.fecha_fin 
				FROM licitacion li 
                join gobierno g on li.gobierno_id=g.id
                $where
				order by fecha_inicio");

    	return $query->result();

    }

    /* usar los ids numericos y continuos no es conveniente, por eso se usa el UID 
    se usa para mandar datos publicos a la web e incluye múltiples datos 
    */
    function load($uid){
        $q = "SELECT li.id, g.nombre gobierno, li.uid, li.nombre titulo, 
                li.detalle descripcion, li.documento, li.imagen, li.fecha_inicio, 
                li.fecha_fin, o.nombre observador, o.descripcion observador_descripcion,
                o.documento_url observador_documento, li.cierre_observador_url,
                li.cierre_observador_txt 
                FROM licitacion li 
                join gobierno g on li.gobierno_id=g.id
                left join observador o on li.observador_id=o.id 
                where li.uid='$uid'";

        $query = $this->db->query($q);
        $licitacion = $query->row();
        $ret = ['licitacion' => $licitacion ];
        // postulaciones aceptadas
        $postulaciones = $this->get_postulaciones($licitacion->id);
        $ret['postulaciones'] = $postulaciones;

        return $ret;
    }

    function load_by_id($licitacion_id){
        $q = "SELECT g.nombre gobierno, li.uid, li.id, li.nombre titulo, 
                li.detalle descripcion, li.documento, li.imagen, li.fecha_inicio, li.fecha_fin
                , li.gobierno_id, li.observador_id 
                FROM licitacion li 
                join gobierno g on li.gobierno_id=g.id
                where li.id=$licitacion_id";

        $query = $this->db->query($q);

        if (!$query) {
            $error = $this->db->error(); // Has keys 'code' and 'message'
            $txt = "Error sql ($q) [" .$error['code']. "-" .$error['message'] ."]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return false;}
        
        return $query->row();        
    }

    /* obtener las postulaciones (def, solo aceptadas)*/
    function get_postulaciones($licitacion_id, $status=3) {
        $this->load->model('postulaciones_model');
        $postulaciones = $this->postulaciones_model->search($licitacion_id);
        return $postulaciones;
    }
}