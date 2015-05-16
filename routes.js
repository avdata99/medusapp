App.Router = Backbone.Router.extend({
  routes: {
    '': 'home',
    'licitaciones': 'licitaciones',
    'licitacion/:slug': 'licitacion',
    'MedusApp/:slug': 'section',
    'suscribe': 'suscribe',
    'registrar-empresa': 'registrarEmpresa',
    'registrar-municipio': 'registrarMunicipio',
    'registrar-ciudadano': 'registrarCiudadano',
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

  registrarEmpresa: function() {
    setPage('/registrar-empresa', 'Registrar empresa', 'Registrar empresa para aplicar a licitaciones públicas vía MedusApp');
    App.Models.empresasModel = new empresasModel();
    App.Models.empresasModel.getTextosRegistro();
    App.Views.registroEmpresaView = new registroEmpresaView({model: App.Models.empresasModel});
    App.Views.registroEmpresaView.render();
  },
  registrarMunicipio: function() {
    setPage('/registrar-municipio', 'Registrar municipio', 'Registrar municipio para administrar licitaciones públicas vía MedusApp');
    $('#main_title').html('Registrar Municipio');
    $('#main_container').html('Aún no es posible registrar municipios al sistema. <br/><a href="/#suscribe">Suscríbase</a> para recibir novedades');
  },
  registrarCiudadano: function() {
    setPage('/registrar-ciudadano', 'Registrar ciudadano', 'Registrar ciudadano para conocer licitaciones públicas vía MedusApp');
    $('#main_title').html('Registrar Ciudadano');
    $('#main_container').html('Aún no es posible registrarse como ciudadano al sistema.<br/> <a href="/#suscribe">Suscríbase</a> para recibir novedades');
  },

  notyet: function() {
    setPage('/notyet', 'No implementado', 'No implementado');
    $('#main_title').html('No implementado');
    $('#main_container').html('En desarrollo');
    
  },

  fail404: function() {
    setPage('/404', 'Error 404', 'Error 404');
    $('#main_title').html('UPS <small>no tenemos nada que mostrar aqui</small>');
    $('#main_container').html('Prueba regresar a la <a href="/">home</a>.');
  }

});

new App.Router;
Backbone.history.start();