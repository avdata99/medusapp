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
    setPage('/licitaciones', 'Licitaciones', 'Licitaciones disponibles en MedusApp');
    $('#main_title').html('Licitaciones disponibles <small>(DEMO)</small>');
    App.Models.licitaciones = new licitacionesCollection();
    App.Models.licitaciones.getLicitaciones(); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Collections.licitacionesView = new licitacionesCollectionView({collection: App.Models.licitaciones});
    },

  licitacion: function(slug){
    setPage('/licitacion/' + slug, 'Licitacion ' + slug, 'Licitacion '+slug+' en MedusApp');
    App.Models.licitacion = new licitacionModel();
    App.Models.licitacion.getLicitacion(slug); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.licitacionLandingView = new licitacionLandingView({model: App.Models.licitacion});
    App.Views.licitacionLandingView.render();
  },

  section: function(slug){
    setPage('/section/' + slug, 'Seccion ' + slug, 'MedusApp ' + slug);
    App.Models.section = new sectionModel();
    App.Models.section.getSection(slug); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.sectionView = new sectionView({model: App.Models.section});
    App.Views.sectionView.render();
  },

  suscribe: function(){
    setPage('/suscribe', 'suscribe', 'Suscribirse a las novedades de MedusApp');
    App.Views.mailChimp = new mailChimpView();
    App.Views.mailChimp.render();
  },

  notyet: function() {
    setPage('/notyet', 'No implementado', 'No implementado');
    $('#main_title').html('No implementado');
    $('#main_container').html('En desarrollo');
    
  },

  fail404: function() {
    setPage('/404', 'Error 404', 'Error 404');
    alert("404");
    
  }

});

new App.Router;
Backbone.history.start();