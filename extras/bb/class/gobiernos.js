/** cada gobierno */
var gobiernoModel = Backbone.Model.extend({
    defaults: {
        nombre: null, 
        uid: null,
        pais: null,
        texto_presentacion: null,
        logo: null,
        url: null,
        licitaciones:[],
    },
    getGobierno: function(slug){
        self = this;

        var url = App.Configuration.Api + '/gobiernos/load/' + slug;
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get gobierno info
        self.set(data.gobierno);
        self.set('licitaciones', data.licitaciones);
        });
      xhr.fail(function(data){console.log("failed on getGov");});

      //#TODO obtener los documentos de las empresas
      //#TODO obtener el histórico de hechos
    },
});

var gobiernosCollection = Backbone.Collection.extend({
    
    model: gobiernoModel,

    getGobiernos: function(){
        self = this;
        var url = App.Configuration.Api + '/gobiernos';
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get extra info
        var panels = []; //clear
        _.each(data, function(gobierno){
            var li = self.add(gobierno);
            li.set('url', '/#gobierno/' + gobierno.uid);
        });
        
        });
      xhr.fail(function(data){console.log("failed on getGobiernos");});
    },
    });

var gobiernoLandingView = Backbone.View.extend({
    template: template('gobiernoLanding'),
    render: function(){
        gov = this.model.attributes;
        $('#main_title').html(gov.nombre + ' <small>' + gov.pais + '</small>');
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);

        return this;
        },
    });

var gobiernoView = Backbone.View.extend({
    tagName: 'li',
    template: template('gobierno'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.addClass('span6');
        this.$el.html(tpl);

        return this;
        },
    });

var gobiernoCollectionView = Backbone.View.extend({
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
        this.collection.each(function(gobierno) {
            if (c == 3){
                $row = this.addRow(true);
                c = 0;
            }
            var liView = new gobiernoView({ model: gobierno });
            $row.append(liView.render().el);
            c = c + 1;
        }, this);

        return this;
    }
    });

