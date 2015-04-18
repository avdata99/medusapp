/** cada una de las licitaciones */
var licitacionModel = Backbone.Model.extend({
    defaults: {
        titulo: 'Titulo licitacion',
        descripcion: 'Descripcion licitacion',
        gobierno: 'Gobierno',
        id: 0
    }
});

/** el conjunto de las licitaciones */
var licitacionesModel = Backbone.Model.extend({
    defaults: {
        panels=[]
        },

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
            byStates[doms.estado] = doms.total;
            total = total + parseInt(doms.total);
            panels.push( 
                new licitacionModel({
                    titulo: licitacion.titulo,
                    descripcion: licitacion.descripcion,
                    gobierno: licitacion.gobierno,
                    id: licitacion.id 
                    url: '#licitacion/' + licitacion.id
                    }));
        });
        self.set('panels', panels);
        self.set('domainByStates', byStates);
        self.set('totalDomains', total);
        self.set('panelTotal', new panelPrimaryModel({
            color: 'panel-red', //panel-primary, panel-green, panel-yellow
            icon: 'fa-tasks', value: total, title: 'Dominios', url: '#'
            }));

        });
      xhr.fail(function(data){
        console.log("failed on getLicitaciones");
        });
    },
    });


var licitacionesView = Backbone.View.extend({
    el: '#panelPrimary',
    template: template('panelTable'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.html(tpl);
        return this;
        },
    });