/** cada licitacion*/
var licitacionModel = Backbone.Model.extend({
    defaults: {
        titulo: null,
        descripcion: null,
        gobierno: null,
        documento: null,
        imagen: null,
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
                    documento: licitacion.documento,
                    imagen: (licitacion.imagen) ? licitacion.imagen : 'licitaciones-default.jpg',
                    url: '/licitacion/ver/' + licitacion.uid
                    });
        });
        
        });
      xhr.fail(function(data){
        console.log("failed on getLicitaciones");
        });
    },
    });


var licitacionView = Backbone.View.extend({
    tagName: 'li',
    template: template('licitacion'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.addClass('span4');
        this.$el.html(tpl);

        return this;
        },
    });

var licitacionesCollectionView = Backbone.View.extend({
    el: '#lista_licitaciones',
    initialize: function(){
        this.render();
    },
    
    addRow: function(append){
        $row = $('<div class="row-fluid"></div>');
        $rowul = $("<ul class='thumbnails'></ul>");
        $row.append($rowul);

        if (append){ this.$el.append($row); }

        return $rowul;
    },

    render: function() {
        this.$el.html("");
        $row = this.addRow(true);
        c = 0;
        this.collection.each(function(licitacion) {
            if (c == 3){
                $row = this.addRow(true);
                c = 0;
            }
            var liView = new licitacionView({ model: licitacion });
            $row.append(liView.render().el);
            c = c + 1;
        }, this);

        return this;
    }
    });

