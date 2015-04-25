var sectionModel = Backbone.Model.extend({
	defaults: {
		titulo: '',
		texto: '',
	},
	getSection: function(slug){
        self = this;
        var url = App.Configuration.Api + '/info/load/' + slug;
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get licitacion info
        self.set({titulo: data.descripcion, texto: data.texto});
        });
      xhr.fail(function(data){console.log("failed on getSection");});
    },
});

var sectionView = Backbone.View.extend({
    template: template('section'),
    render: function(){
        section = this.model.attributes;
        $('#main_title').html(section.titulo);
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        return this;
        },
    });