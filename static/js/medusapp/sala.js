// scripts para la sala de negociaciones

	$(function() {
	  $('.btn_enviar_chat').on('click', function(){
	  	var sala_id = $(this).data('sala');
	  	var mensaje = $('#input_mensaje_' + sala_id).val();
	  	enviar_chat(mensaje, sala_id);
	  })

	});

	enviar_chat = function(txt, sala_id){
		alert(txt + ' -- ' + sala_id);
	};
