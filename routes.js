App.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    // 'withParams/:param1/:param2': 'funcWithParams',
    'licitacion/:slug': 'licitacion',
    '*other': 'fail404',
  },

  /** mostrar pagina principal con las licitaciones */
  index: function() {
    
    touchAnalytics('/index.html', 'Home');
    App.Models.licitaciones = new licitacionesCollection();
    App.Models.licitaciones.getLicitaciones(); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Collections.licitacionesView = new licitacionesCollectionView({collection: App.Models.licitaciones})
    },

  /*
  funcWithParams: function(param1, param2){
    
    touchAnalytics('/func.html', 'Func.' + param1 + '.' + param2);
        
  },
 */

  licitacion: function(slug){

  },

  fail404: function() {
    touchAnalytics('/404', 'Error 404');
    alert("404");
    
  }

});

new App.Router;
Backbone.history.start();