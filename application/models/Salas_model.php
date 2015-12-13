<?php

/* salas de negociacion de las licitaciones */
class Salas_model extends CI_Model {

	/*crear al menos una sala de chat para una licitaion*/
	public function check_starting_chats($licitacion_id){
		$q = "SELECT * FROM licitacion_salas where licitacion_id=$licitacion_id";
		$query = $this->db->query($q);
		if ($query->num_rows() > 0) return TRUE;

		// crear la primera sala
		$q = "INSERT INTO licitacion_salas 
				(licitacion_id, nombre, descripcion) 
				VALUES 
				($licitacion_id, 'General', 'Sala de negociaciones general de la licitación');";
		$query = $this->db->query($q);
		$id = $this->db->insert_id();

		// meterle un hola
		$this->add_chat($id, 1, 'Bienvenido a la sala de negociaciones', 'sistema', 'MedusApp');

        return TRUE;
	}

	// enviar un mensaje a una sala de chat
	public function add_chat($licitacion_salas_id, $user_id, $mensaje, $perfil_tipo, $perfil_nombre){
		$q = "INSERT INTO licitacion_sala_chat 
				(licitacion_salas_id, user_id, mensaje, perfil_tipo, perfil_nombre, momento) 
				VALUES 
				($licitacion_salas_id, $user_id, '$mensaje', 
				'$perfil_tipo', '$perfil_nombre', '".date('Y-m-d H:i:s')."');";
		$query = $this->db->query($q);
		
		return $this->db->insert_id(); 
	}

	/* obtener los chats y mensajes en cada una */
	public function get_chats($licitacion_id){
		$q = "SELECT ls.nombre titulo_chat, ls.descripcion descripcion_chat, u.nombre usuario, 
				lsc.perfil_tipo, lsc.perfil_nombre, lsc.mensaje, lsc.momento, lsc.licitacion_salas_id 
				FROM licitacion_sala_chat lsc
				join licitacion_salas ls ON lsc.licitacion_salas_id = ls.id
				join usuario u ON lsc.user_id=u.id
				where ls.licitacion_id=$licitacion_id
				order by lsc.id";

		$query = $this->db->query($q);
		$chats = $query->result();
		//reordenar
		$ret = [];
		foreach ($chats as $chat) {
			$id = $chat->licitacion_salas_id;
			if (!isset($ret[$id])) {
				$ret[$id] = (object)['titulo_chat'=>$chat->titulo_chat, 
					'descripcion_chat'=>$chat->descripcion_chat,
					'chats'=>[] ];
				}
			$ret[$id]->chats[] = $chat;
		}

		return $ret;
        
	}

}