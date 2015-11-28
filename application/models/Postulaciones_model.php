<?php

class Postulaciones_model extends CI_Model {

    /* Agregar una postulacion, predeterminado en status=1=Solicitado*/
    public function add($licitacion_id, $empresa_id, $status=1){
        $q = "INSERT INTO licitacion_postulaciones 
                (id_licitacion, id_empresa, status) 
                VALUES 
                ('$licitacion_id', '$empresa_id', '$status');";

        $query = $this->db->query($q);
        if (!$query) 
            {
            $error = $this->db->error(); // Has keys 'code' and 'message'
            $txt = "Error sql ($q) [" .$error['code']. "-" .$error['message'] ."]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return false;}

        return $this->db->insert_id();

    }

    /* obtener una lista de postulaciones por empresa o por gobierno*/
    public function lista($soloActivas=FALSE, $gobiernos=[], $empresas=[]){
        /* 
        soloActivas se refiere a la fecha de inicio y cierre 
        gobiernos es una lista de IDs
        */
        $filtros = [];
        if (count($gobiernos) > 0){
            $gobs = implode(',', $gobiernos);
            $filtros[] = 'l.gobierno_id IN ('.$gobs.')';
        }
        if (count($empresas) > 0){
            $emps = implode(',', $empresas);
            $filtros[] = 'lp.id_empresa IN ('.$emps.')';
        }
        if ($soloActivas){
            $ahora = date("Y-m-d H:i:s");
            $filtros[] = "l.fecha_inicio>='$ahora' AND l.fecha_fin <='$ahora'";
        }

        $where = (count($filtros) == 0) ? '' : ' WHERE ' . implode(' AND ', $filtros). ' ';

    	$query = $this->db->query("SELECT lp.*, g.nombre gobierno, e.nombre empresa, lps.estado 
            FROM licitacion_postulaciones lp 
            join licitacion l on lp.id_licitacion=l.id 
            join empresa e on lp.id_empresa = e.id 
            join licitacion_postulacion_status lps on lp.status = lps.id 
            join gobierno g on l.gobierno_id=g.id"
            . $where
            );

    	return $query->result();

    }

    function load($id){
        $query = $this->db->query("SELECT lp.*, g.nombre gobierno, e.nombre empresa, lps.estado 
            FROM licitacion_postulaciones lp 
            join licitacion l on lp.id_licitacion=l.id 
            join empresa e on lp.id_empresa = e.id 
            join licitacion_postulacion_status lps on lp.status = lps.id 
            join gobierno g on l.gobierno_id=g.id
            where lp.id=$id");

        return $query->row();        
    }
}