// scripts para la sala de negociaciones

	$(function() {
	  $('.btn_enviar_chat').on('click', function(){
	  	var sala_id = $(this).data('sala');
	  	var mensaje = $('#input_mensaje_' + sala_id).val();
	  	enviar_chat(mensaje, sala_id);
	  })

	});

	enviar_chat = function(txt, sala_id){
		var url = '/api/salas/mensaje';
		var data = {'mensaje': txt, 'sala_id': sala_id};
		var xhr = $.ajax({
					  type: "POST",
					  url: url,
					  data: data,
					  dataType: 'json'
					});
		xhr.done(function(data){
			console.log('data DONE');
			console.log(data);
		});
		
	};
