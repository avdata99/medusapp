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
});

/** vista del registro de empresa en el sistema*/
var registroEmpresaView = Backbone.View.extend({
    template: template('registrarEmpresa'),
    render: function(){
        section = this.model.attributes;
        $('#main_title').html(section.registroTitulo);
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        return this;
        },
    });