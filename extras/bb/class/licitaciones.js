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
    },
    getLicitacion: function(slug){
        self = this;
        var url = App.Configuration.Api + '/licitaciones/load/' + slug;
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get licitacion info
        self.set(data);
        });
      xhr.fail(function(data){console.log("failed on getLicitacionLanding");});
    },
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
                    url: '/#licitacion/' + licitacion.uid
                    });
        });
        
        });
      xhr.fail(function(data){console.log("failed on getLicitaciones");});
    },
    });

var licitacionLandingView = Backbone.View.extend({
    template: template('licitacionLanding'),
    render: function(){
        lic = this.model.attributes;
        $('#main_title').html(lic.titulo + ' <small>' + lic.gobierno + '</small>');
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);

        return this;
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
    el: '#main_container',
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

