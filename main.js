(function(){

  // Init App Object
  window.App = {
    Models: {},
    Collections: {},
    Views: {},
    Router: {},
    Configuration: {Api: '/api', UAnalitycs: 'UA-62272059-1'},
    Logs: ''
  };

  ga('create', App.Configuration.UAnalitycs, 'auto');

  // Helper para cargar template desde archivo
  window.template = function(id){
    $.ajax({url: '/extras/bb/tpl/' + id + '.tpl'
      , dataType:'text'
      , async: false
      , success: function(data){
          dat = String(data);
          }
        });
    return _.template( dat );
    
  };

  /** agregar registro al log interno javascript*/
  window.addLog = function(txt){
    App.Logs = App.Logs + '<br/>' + txt;
  };
  
  /** marcar visita en google analytics */
  window.touchAnalytics = function(page, title){
    ga('send', 'pageview', {'page': page,'title': title});
  };

  /**Limpiar la parte central de la web para cargar contenido */
  window.clearHome = function(){
    $('#main_container').html('');
  }

  /** para cada cambio de pagina en el router de backbone*/
  window.setPage = function(url, title, description){
    document.title = title;
    document.description = description;
    touchAnalytics(url, title);
    clearHome();
  }

  appEvents = _.extend({}, Backbone.Events);

  })();