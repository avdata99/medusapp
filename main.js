(function(){

  // Init App Object
  window.App = {
    Models: {},
    Collections: {},
    Views: {},
    Router: {},
    Configuration: {Api: '/api', UAnalitycs: 'UA-62272059-1'},
    Logs: '',
    isDevelop: (window.location.href.search('medusapp.org') < 0),
    social_values: {},
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
    if (App.isDevelop){
      console.log(txt);
      $('#medusalogs').append('<p>'+txt+'</p>');
    }
    
  };
  
  /** marcar visita en google analytics */
  window.touchAnalytics = function(page, title){
    ga('send', 'pageview', {'page': page,'title': title});
  };

  /**Limpiar la parte central de la web para cargar contenido */
  window.clearHome = function(){
    $('#main_container').html('');
  };

  /** para cada cambio de pagina en el router de backbone*/
  window.setPage = function(url, title, description){
    addLog('Goto ' + url + ' (title: ' + title + ' description: ' + description + ')');
    document.title = title;
    document.description = description;
    touchAnalytics(url, title);
    clearHome();
  };

  /** get default values for social accounts and tools (twitter, facebook, mailchimp, etc)*/
  window.getSocialValues = function(){
    var url = App.Configuration.Api + '/info/social';
    var xhr = $.ajax({url: url, type: 'GET', async: false});
    
    xhr.done(function(data){ // get social info
      _.each(data, function(social){
          App.social_values[social.social_name] = social.social_value;
          });
      });
    xhr.fail(function(data){console.log("failed on get social values");});
  };

  getSocialValues();

  appEvents = _.extend({}, Backbone.Events);

  })();