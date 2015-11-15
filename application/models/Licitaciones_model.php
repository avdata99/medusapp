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
        $filtros = []
        if (count($gobiernos) > 0){
            $gobs = implode(',', $gobiernos)
            $filtros[] = 'gobierno_id IN ()';
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

    function load($uid){
        $query = $this->db->query("SELECT g.nombre gobierno, li.uid, li.nombre titulo, 
                li.detalle descripcion, li.documento, li.imagen, li.fecha_inicio, li.fecha_fin 
                FROM licitacion li join gobierno g on li.gobierno_id=g.id
                where li.uid='$uid'");

        return $query->row();        
    }
}