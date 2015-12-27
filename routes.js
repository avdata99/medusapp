App.Router = Backbone.Router.extend({
  routes: {
    '': 'home',
    'licitaciones': 'licitaciones',
    'gobiernos': 'gobiernos',
    'licitacion/:slug': 'licitacion',
    'gobierno/:slug': 'gobierno',
    'MedusApp/:slug': 'section',
    'suscribe': 'suscribe',
    'registrar-empresa': 'registrarEmpresa',
    'registrar-municipio': 'registrarMunicipio',
    'registrar-ciudadano': 'registrarCiudadano',
    'blog/:post': 'blog', 
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

  gobiernos: function() {
    setPage('/gobiernos', 'Gobiernos', 'Gobiernos participantes en MedusApp');
    $('#main_title').html('Gobiernos que usan MedusApp <small>(DEMO)</small>');
    App.Models.gobiernos = new gobiernosCollection();
    App.Models.gobiernos.getGobiernos(); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Collections.gobiernosView = new gobiernoCollectionView({collection: App.Models.gobiernos});
    },

  licitacion: function(slug){
    setPage('/licitacion/' + slug, 'Licitacion ' + slug, 'Licitacion ' + slug + ' en MedusApp');
    App.Models.licitacion = new licitacionModel();
    App.Models.licitacion.getLicitacion(slug); // carga la licitacion

    // cargar las licitaciones leidas en la home
    App.Views.licitacionLandingView = new licitacionLandingView({model: App.Models.licitacion});
    App.Views.licitacionLandingView.render();
  },

  gobierno: function(slug){
    setPage('/gobierno/' + slug, 'Gobierno ' + slug, 'Gobierno ' + slug + ' en MedusApp');
    App.Models.gobierno = new gobiernoModel();
    App.Models.gobierno.getGobierno(slug); // carga la licitacion

    // cargar las licitaciones leidas en la home
    App.Views.gobiernoLandingView = new gobiernoLandingView({model: App.Models.gobierno});
    App.Views.gobiernoLandingView.render();
  },

  section: function(slug){
    setPage('/section/' + slug, 'Seccion ' + slug, 'MedusApp ' + slug);
    App.Models.section = new sectionModel();
    App.Models.section.getSection(slug); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.sectionView = new sectionView({model: App.Models.section});
    App.Views.sectionView.render();
  },

  blog: function(post){
    setPage('/blog/' + post, 'Blog ' + post, 'Blog ' + post);
    App.Models.blog = new blogModel();
    App.Models.blog.getPost(post); // carga todas las licitaciones

    // cargar las licitaciones leidas en la home
    App.Views.blogView = new blogView({model: App.Models.blog});
    App.Views.blogView.render();
  },

  suscribe: function(){
    setPage('/suscribe', 'suscribe', 'Suscribirse a las novedades de MedusApp');
    App.Models.mailChimp = new mailChimpModel();
    App.Views.mailChimp = new mailChimpView({model: App.Models.mailChimp});
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