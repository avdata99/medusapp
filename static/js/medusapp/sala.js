// scripts para la sala de negociaciones

	down_scrolls = function(){
		var h = $($('.panel-body')[0]).height() * 1000;
		$('.panel-body').scrollTop(h);
		};

	$(function() {
	  $('.btn_enviar_chat').on('click', function(){
	  	var sala_id = $(this).data('sala');
	  	var mensaje = $('#input_mensaje_' + sala_id).val();
	  	var perfil_tipo = $(this).data('perfiltipo');
	  	var perfil_nombre = $(this).data('perfilnombre');
	  	enviar_chat(mensaje, sala_id, perfil_tipo, perfil_nombre);
	  });

		setTimeout (function () {down_scrolls();}, 500); // (?)	  
	});


	enviar_chat = function(txt, sala_id, perfil_tipo, perfil_nombre){
		var url = '/api/salas/mensaje';
		var CSRF = $('#CSRF').html();
		var data = {'mensaje': txt, 'sala_id': sala_id, 
			'CSRF': CSRF, 
			'perfil_tipo': perfil_tipo,
			'perfil_nombre': perfil_nombre
			};
		var xhr = $.ajax({
					  type: "POST",
					  url: url,
					  data: data,
					  dataType: 'json'
					});
		xhr.done(function(data){
			//si fue OK mostrar el nuevo CHAT
			var $li = $("#generic_chat_message_element").clone();
			// $("#user_txt", $li).html(perfil_tipo);
			$("#msg_txt", $li).html(txt);
			$("#lista_mensajes_" + sala_id).append($li);
			$("#input_mensaje_" + sala_id).val('');
			down_scrolls();
		});

	

	};
