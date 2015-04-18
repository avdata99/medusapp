(function(){

  // Init App Object
  window.App = {
    Models: {},
    Collections: {},
    Views: {},
    Router: {},
    Configuration: {Api: 'http://medusapp/ci.php/api', UAnalitycs: 'UA-nnnnnnnnn-2'},
    Logs: ''
  };

  // Template Helper
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

  window.addLog = function(txt){
    App.Logs = App.Logs + '<br/>' + txt;
  };
  
  window.touchAnalytics = function(page, title){
    ga('send', 'pageview', {'page': page,'title': title});
  };

  appEvents = _.extend({}, Backbone.Events);

  })();