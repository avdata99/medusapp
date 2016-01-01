/** cada observador */
var observadorModel = Backbone.Model.extend({
    defaults: {
        nombre: null, 
        descripcion: null, 
        uid: null,
        pais: null,
        foto: null,
        documento_url: null,
        url: null,
        licitaciones:[],
    },
    getObservador: function(slug){
        self = this;

        var url = App.Configuration.Api + '/observadores/load/' + slug;
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get observador info
        self.set(data.observador);
        self.set('licitaciones', data.licitaciones);
        });
      xhr.fail(function(data){console.log("failed on getobservador");});

      //#TODO obtener los documentos de las empresas
      //#TODO obtener el histórico de hechos
    },
});

var observadoresCollection = Backbone.Collection.extend({
    
    model: observadorModel,

    getObservadores: function(){
        self = this;
        var url = App.Configuration.Api + '/observadores';
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get extra info
        var panels = []; //clear
        _.each(data, function(observador){
            var li = self.add(observador);
            li.set('url', '/#observador/' + observador.uid);
        });
        
        });
      xhr.fail(function(data){console.log("failed on getobservador");});
    },
    });

var observadorLandingView = Backbone.View.extend({
    template: template('observadorLanding'),
    render: function(){
        observador = this.model.attributes;
        $('#main_title').html(observador.nombre + ' <small>' + observador.pais + '</small>');
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);

        return this;
        },
    });

var observadorView = Backbone.View.extend({
    tagName: 'li',
    template: template('observador'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.addClass('span6');
        this.$el.html(tpl);

        return this;
        },
    });

var observadorCollectionView = Backbone.View.extend({
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
        this.collection.each(function(observador) {
            if (c == 3){
                $row = this.addRow(true);
                c = 0;
            }
            var liView = new observadorView({ model: observador });
            $row.append(liView.render().el);
            c = c + 1;
        }, this);

        return this;
    }
    });

