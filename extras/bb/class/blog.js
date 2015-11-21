var blogModel = Backbone.Model.extend({
	defaults: {
		texto: '',
	},
	getPost: function(post){
        self = this;
        $.ajax({url: '/extras/bb/blog/' + post + '.html'
              , dataType:'html' // 'text'
              , async: false
              , success: function(data){
                  dat = String(data);
                  }
                });
        
      self.set({texto: dat});
    },
});

var blogView = Backbone.View.extend({
    template: template('blog'),
    render: function(){
        // section = this.model.attributes;
        // $('#main_title').html(section.titulo);
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        return this;
        },
    });