App.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    // 'withParams/:param1/:param2': 'funcWithParams',
    '*other': 'fail404',
  },

  /** mostrar pagina principal */
  index: function() {
    
    touchAnalytics('/index.html', 'Home');
    },

  /*
  funcWithParams: function(param1, param2){
    
    touchAnalytics('/func.html', 'Func.' + param1 + '.' + param2);
        
  },
 */
  
  fail404: function() {
    touchAnalytics('/404', 'Error 404');
    alert("404");
    
  }

});

new App.Router;
Backbone.history.start();