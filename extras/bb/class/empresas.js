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

    /** registrar empresa vía formulario */
    registrarEmpresa: function(){
        if (!$('#registrarEmpresaForm').valid()){
            addLog('Empresa invalida');
            return false;
        }
           
        // mantener configurable la ubicacion del API para carga de datos
        var url = App.Configuration.Api + '/empresas/registrar';
        var postData = $('#registrarEmpresaForm').serializeArray();
        
        var xhr = $.ajax({
            type: 'POST',
            url: url,
            data: postData});

        xhr.done(function(data){
            addLog('Empresa registrada Ok');
            msg = 'Su empresa ha sido registrada correctamente.<br/>Los datos serán \
                revisados.<br/>Recibirá una notificacion por email para comenzar a \
                postularse a licitaciones públicas';
            $('#registrarEmpresaFormContainer').html(msg); 
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
        var self = this;
        section = this.model.attributes;
        $('#main_title').html(section.registroTitulo);
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        
        var validator = $('#registrarEmpresaForm').validate({
            rules: {
                razonsocial: "required",
                email: { required: true, email: true }
                },
            messages: {
                razonsocial: "La razón social es obligatoria",
                nombre: 'El responsable de la cuenta con Nombre y Apellido es requerido',
                apellido: 'El responsable de la cuenta con Nombre y Apellido es requerido',
                cuit: 'El código de identificación tributario es requerido',
                email: {
                required: "El email es requerido",
                email: "El email esta mal escrito, es inválido"
                }
            }
        });
        
        $('#registrar').on('click', function(){    
            if ($('#registrarEmpresaForm').valid()){
                self.model.registrarEmpresa();    
            }
        });
        

        return this;
        },
    });