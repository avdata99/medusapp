App.Router = Backbone.Router.extend({
  routes: {
    '': 'home',
    'licitaciones': 'licitaciones',
    'licitacion/:slug': 'licitacion',
    'MedusApp/:slug': 'section',
    'suscribe': 'suscribe',
    'registrar-empresa': 'notyet',
    'registrar-municipio': 'notyet',
    'registrar-ciudadano': 'notyet',
    '*other': 'fail404',
  },

  home: function(){
    this.navigate('/MedusApp/que-es', { trigger: true });
  },

  /** mostrar pagina principal con las licitaciones */
  licitaciones: function() {
    touchAnalytics('/index.html', 'Home');
    clearHome();
    $('#main_title').html('Licitaciones disponibles <small>(DEMO)</small>');
    App.Models.licitaciones = new licitacionesCollection();
    App.Models.licitaciones.getLicitaciones(); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Collections.licitacionesView = new licitacionesCollectionView({collection: App.Models.licitaciones});
    },

  licitacion: function(slug){
    touchAnalytics('/licitacion/' + slug, 'Licitacion ' + slug);
    clearHome();
    App.Models.licitacion = new licitacionModel();
    App.Models.licitacion.getLicitacion(slug); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.licitacionLandingView = new licitacionLandingView({model: App.Models.licitacion});
    App.Views.licitacionLandingView.render();
  },

  section: function(slug){
    touchAnalytics('/section/' + slug, 'Seccion ' + slug);
    clearHome();
    App.Models.section = new sectionModel();
    App.Models.section.getSection(slug); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.sectionView = new sectionView({model: App.Models.section});
    App.Views.sectionView.render();
  },

  suscribe: function(){
    touchAnalytics('/suscribe', 'suscribe ');
    clearHome();
    App.Views.mailChimp = new mailChimpView();
    App.Views.mailChimp.render();
  },

  notyet: function() {
    touchAnalytics('/notyet', 'No implementado');
    $('#main_title').html('No implementado');
    $('#main_container').html('En desarrollo');
    
  },

  fail404: function() {
    touchAnalytics('/404', 'Error 404');
    alert("404");
    
  }

});

new App.Router;
Backbone.history.start();