/** sobre el formulario de registro de empresas */
var empresasModel = Backbone.Model.extend({
	defaults: {
		registroTitulo: '',
		registroTexto: '',
	},
	getTextosRegistro: function(){
        self = this;
        var url = App.Configuration.Api + '/info/load/invitacion-registro-empresas';
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get licitacion info
        self.set({registroTitulo: data.descripcion, registroTexto: data.texto});
        });
      xhr.fail(function(data){console.log("failed on getEmpresa");});
    },

    /** registrar empresa */
    registrarEmpresa: function(){
    // mantener configurable la ubicacion del API para carga de datos
        var url = App.Configuration.Api + '/empresas/registrar';
        // var postData = $('#registrarEmpresa').serializeArray();
        postData = {'razonsocial': $('#razonsocial').val()};
        var xhr = $.ajax({
            method: 'POST',
            url: url,
            data: postData});

        xhr.done(function(data){
            console.log(data);
            addLog('Empresa registrada Ok');
            alert('Ok');
        });

        xhr.fail(function(data){
            addLog('Fail to reg empresa');
        });  
    }
    

});

/** vista del registro de empresa en el sistema*/
var registroEmpresaView = Backbone.View.extend({
    template: template('registrarEmpresa'),
    render: function(){
        section = this.model.attributes;
        $('#main_title').html(section.registroTitulo);
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        $('#registrar').on('click', this.model.registrarEmpresa);

        return this;
        },
    });


  

  