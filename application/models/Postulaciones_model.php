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

    /* ver si una empresa esta postulada y aceptada a una licitacion */
    public function validate($licitacion_id, $empresa_id){
        $q = "SELECT lp.*, g.nombre gobierno, e.nombre empresa
            , lps.estado, l.nombre licitacion 
            FROM licitacion_postulaciones lp 
            join licitacion l on lp.id_licitacion=l.id 
            join empresa e on lp.id_empresa = e.id 
            join licitacion_postulacion_status lps on lp.status = lps.id 
            join gobierno g on l.gobierno_id=g.id
            where lp.id_licitacion=$licitacion_id and lp.id_empresa=$empresa_id;";

        $query = $this->db->query($q);

        if ($query->num_rows() == 1) {
            $row = $query->row_array();
            if ($row['status'] == 3){ 
                $res = (object)['status'=>TRUE, 'results'=>$row];
            }
            elseif ($row['status'] == 2) {
                $res = (object)['status'=>FALSE, 'error'=>'La postulacion ha sido rechazada.'];
            }
            elseif ($row['status'] == 1) {
                $res = (object)['status'=>FALSE, 'error'=>'La postulacion no ha sido analizada aún.'];
            }
        }
        else if ($query->num_rows() == 0 || $query->num_rows() > 1) {
            $res = (object)['status'=>FALSE, 'error'=>'Postulacion inválida, consulte al administrador'];
            $txt = "Postulacion invalida [".$query->num_rows()."] [$licitacion_id, $empresa_id]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 2);
        }

        return $res;
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

    function search($licitacion_id=0, $empresa_id=0, $status=3){
        $q = "SELECT lp.*, g.nombre gobierno, e.nombre empresa, lps.estado 
            FROM licitacion_postulaciones lp 
            join licitacion l on lp.id_licitacion=l.id 
            join empresa e on lp.id_empresa = e.id 
            join licitacion_postulacion_status lps on lp.status = lps.id 
            join gobierno g on l.gobierno_id=g.id
            where lp.status=$status";

        if ($licitacion_id > 0)  $q .= " AND lp.id_licitacion=$licitacion_id ";
        if ($empresa_id > 0)  $q .= " AND lp.id_empresa=$empresa_id ";

        $query = $this->db->query($q);

        if (!$query) {
            $error = $this->db->error(); // Has keys 'code' and 'message'
            $txt = "Error sql ($q) [" .$error['code']. "-" .$error['message'] ."]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return false;}

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

        if ($query->num_rows() == 0) {
            return FALSE;
        }

        return $query->row();        
    }

    /* listar los postulantes a una licitacion */
    function licitacion_postulantes($licitacion_id, $solo_aceptadas=TRUE){
        $q = "SELECT * FROM licitacion_postulaciones where id_licitacion=$licitacion_id ";
        if ($solo_aceptadas) $q .= ' AND status=3';
        $query = $this->db->query($q);
        return $query->result();
    }

    function licitacion_datos_pedidos($licitacion_id){
        $q = "SELECT * FROM licitacion_datos_pedidos where id_licitacion=$licitacion_id";
        $query = $this->db->query($q);
        return $query->result();
    }

    function licitacion_datos_entregados($licitacion_id){
        $q = "SELECT lde.*, ldp.id_dato_pedido, ldp.id_licitacion
            FROM licitacion_datos_entregados lde 
            join licitacion_datos_pedidos ldp ON lde.id_licitacion_dato_pedido=ldp.id
            where ldp.id_licitacion=$licitacion_id";
        $query = $this->db->query($q);
        return $query->result();
    }

    function add_licitacion_dato_entregado($id_licitacion_dato_pedido, $empresa_id, $status=1){
        $q = "INSERT INTO licitacion_datos_entregados 
            (id_empresa, id_licitacion_dato_pedido, status) 
            VALUES 
            ($empresa_id, $id_licitacion_dato_pedido, $status);";
        $query = $this->db->query($q);
        if (!$query) {
            $error = $this->db->error(); // Has keys 'code' and 'message'
            $txt = "Error sql ($q) [" .$error['code']. "-" .$error['message'] ."]";
            $seccion = __CLASS__.".".__FUNCTION__;
            $this->errors_model->add($txt, $seccion, 5);
            return FALSE;
        }
        return $this->db->insert_id();
    }

    /* revisar que los documentos no cargados de cada 
    empresa que postula tengan al menos un registro 
    Si solicita una empresa se revisa esa, si empresa_id=0 entonces reviso todas*/
    function check_documents($licitacion_id, $empresa_id=0){
        $empresas = [];
        if ($empresa_id==0) {
            // ver todas las empresas postuladas
            $postulantes = $this->licitacion_postulantes($licitacion_id);
            foreach ($postulantes as $postulante) {
                $empresas[] = $postulante->id_empresa;
            }
        }
        else {
            $empresas[] = $empresa_id;
        }

        $datos_pedidos = $this->licitacion_datos_pedidos($licitacion_id);
        $datos_entregados = $this->licitacion_datos_entregados($licitacion_id);

        // ver los datos solicitados y cargar los registros para cada
        // empresa cuando no esten cargados
        $added = 0;
        $fails = 0;
        $readys = 0;
        foreach ($datos_pedidos as $dato_pedido) {
            $id_licitacion_dato_pedido = $dato_pedido->id;
            foreach ($empresas as $empresa_id) {
                $ready = FALSE;
                foreach ($datos_entregados as $dato_entregado) {
                    if ($dato_entregado->id_empresa == $empresa_id 
                            && $dato_entregado->id_dato_pedido == $dato_pedido->id_dato_pedido) {
                        $ready = TRUE;
                    }
                }
                // si no esta insertarlo
                if (!$ready) {
                    $ok = $this->add_licitacion_dato_entregado($id_licitacion_dato_pedido, $empresa_id);
                    if ($ok) {$added ++;}
                    else {$fails ++;}
                }
                else {$readys++;}    
            }
        }

        return (object)['ready'=>$readys, 'added'=>$added, 'fails'=>$fails];

    }
}