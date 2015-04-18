/** cada licitacion*/
var licitacionModel = Backbone.Model.extend({
    defaults: {
        titulo: 'Titulo licitacion',
        descripcion: 'Descripcion licitacion',
        gobierno: 'Gobierno',
        img_licitacion: '',
        uid: '',
        id: 0,     
    }
});

var licitacionesCollection = Backbone.Collection.extend({
    
    model: licitacionModel,

    getLicitaciones: function(){
        self = this;
        var url = App.Configuration.Api + '/licitaciones';
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get extra info
        var panels = []; //clear
        _.each(data, function(licitacion){
            self.add({
                    titulo: licitacion.titulo,
                    descripcion: licitacion.descripcion,
                    gobierno: licitacion.gobierno,
                    url: '#licitacion/' + licitacion.uid
                    });
        });
        
        });
      xhr.fail(function(data){
        console.log("failed on getLicitaciones");
        });
    },
    });


var licitacionView = Backbone.View.extend({
    tagName: 'div',
    template: template('licitacion'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.html(tpl);
        return this;
        },
    });

var licitacionesCollectionView = Backbone.View.extend({
    el: '#lista_licitaciones',
    initialize: function(){
        this.render();
    },
    
    render: function() {
        this.$el.html("");
        this.collection.each(function(licitacion) {
            var liView = new licitacionView({ model: licitacion });
            this.$el.append(liView.render().el);
        }, this);

        return this;
    }
    });

