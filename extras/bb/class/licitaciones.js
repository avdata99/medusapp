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
        observador: null,
        observador_descripcion: null,
        observador_documento: null, 
        postulaciones: [],  
        datos_pedidos: [], // documentos que el gobierno pidio
        datos_entregados: [], // documentos entregados por las empresas en el proceso
        fecha_fin: null,
        cierre_observador_txt: null, // texto de cierre del observador
        cierre_observador_url: null, // url del doc de cierre del observador si lo hubiera
    },
    getLicitacion: function(slug){
        self = this;

        var url = App.Configuration.Api + '/licitaciones/load/' + slug;
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get licitacion info
        self.set(data.licitacion);
        self.set('postulaciones', data.postulaciones);
        self.set('datos_pedidos', data.datos_pedidos);
        self.set('datos_entregados', data.datos_entregados);
        });
      xhr.fail(function(data){console.log("failed on getLicitacionLanding");});

      //#TODO obtener los documentos de las empresas
      //#TODO obtener el histórico de hechos
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

