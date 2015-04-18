App.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'showDomain/:domain': 'showDomain',
    'listByStatus/:status': 'listByStatus',
    'deberianCaer': 'deberianCaer',
    'enTramiteDeAlta': 'enTramiteDeAlta',
    'ultimosRegistrados': 'ultimosRegistrados',
    'search/:query/:type': 'search',
    'listByRegistrants/:reg/:name': 'listByRegistrants',
    'mayoresRegistrantes': 'mayoresRegistrantes',
    'mayoresRegistrantes/:desde/:hasta': 'mayoresRegistrantes',
    'registrants/:reg': 'registrants',
    'vencenHoy': 'vencenHoy',
    'reviven': 'reviven',
    'renuevan': 'renuevan',
    'reservas/:extra': 'reservas',
    'listas': 'listas',
    'lista/:lista': 'lista',
    'dominiosAntiguos': 'dominiosAntiguos',
    'especiales': 'especiales',
    'about': 'about',
    '*other': 'default',
  },

  /** mostrar el panel principal */
  index: function() {
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('index');
    $('#mainSectionTitle').html('Datos globales');
    App.Models.general = new generalModel({}); // datos generales sobre dominios, autoinicializado
    var showPanels = App.Models.general.get('panels');
    showPanels.unshift(App.Models.general.get('panelTotal')); //agregar como primero
    App.Collections.panelPrimary = new panelPrimaryCollection(showPanels);//pasarle los paneles listos
    App.Views.panelPrimary = new panelPrimaryViewCollection({collection: App.Collections.panelPrimary});//mostrarlo
    touchAnalytics('/index', 'index ArNicApp');
    },

  showDomain: function(domain) {
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('showDomain', domain);
    $('#mainSectionTitle').html(domain + '.com.ar');
    App.Models.domains = new domainsModel({dominio: domain}); // datos generales sobre un dominio, autoinicializado
    var showPanels = App.Models.domains.get('panels');
    App.Collections.miniPanel = new miniPanelCollection(showPanels);//pasarle los paneles listos
    App.Views.miniPanel = new miniPanelViewCollection({collection: App.Collections.miniPanel});//mostrarlo
    touchAnalytics('/showDomain', 'show ' + domain);
    
  },

  listByStatus: function(status){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('listByStatus', status);
    $('#mainSectionTitle').html('Dominios');
    App.Models.listByStatus = new listDomainsModel({status: status});
    App.Models.listByStatus.getDomainsByStates();
    App.Views.listByStatus = new tableView({model: App.Models.listByStatus.get('tableModel')});
    App.Views.listByStatus.render();
    touchAnalytics('/listByStatus', 'list by status ' + status);
    
  },

  listas: function(){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('listas');
    $('#mainSectionTitle').html('Listas');
    App.Models.listLists = new listListsModel();
    App.Models.listLists.getLists();
    App.Views.listLists = new tableView({model: App.Models.listLists.get('tableModel')});
    App.Views.listLists.render();
    touchAnalytics('/listas', 'listas predefinidas ');
    
  },

  lista: function(lista){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('listas', lista);
    $('#mainSectionTitle').html(lista.replace(/\-/g, ' '));
    App.Models.listLists = new listListsModel();
    App.Models.listLists.getList(lista);
    App.Views.listLists = new tableView({model: App.Models.listLists.get('tableModel')});
    App.Views.listLists.render();
    touchAnalytics('/lista', lista);
    
  },

  deberianCaer: function(status){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('deberianCaer');
    $('#mainSectionTitle').html('Dominios por caer');
    App.Models.listDeberianCaer = new listDeberianCaerModel();
    App.Models.listDeberianCaer.getDomains();
    App.Views.listDeberianCaer = new tableView({model: App.Models.listDeberianCaer.get('tableModel')});
    App.Views.listDeberianCaer.render();
    touchAnalytics('/deberianCaer', 'deberian caer ' + status);
    
  },

  reservas: function(extra){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('reservas');
    var desde = false;
    var hasta = false;
    if (extra == 'desde') desde = true;
    if (extra == 'hasta') hasta = true;
    var title = 'Dominios re-reservados';
    if (desde) title = 'Nuevas reservas';
    if (hasta) title = 'Salen de reserva';
    $('#mainSectionTitle').html(title);
    App.Models.listReservas = new listReservasModel();
    App.Models.listReservas.getReservas(desde, hasta);
    App.Views.listReservas = new tableView({model: App.Models.listReservas.get('tableModel')});
    App.Views.listReservas.render();
    touchAnalytics('/reservas', 'Re-reservas ');
    
  },

  reviven: function(){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('reviven');
    $('#mainSectionTitle').html('Vuelven a registrase');
    App.Models.listReviven = new listRevivenModel();
    App.Models.listReviven.getDomains();
    App.Views.listReviven = new tableView({model: App.Models.listReviven.get('tableModel')});
    App.Views.listReviven.render();
    touchAnalytics('/reviven', 'Reviven ');
    
  },

    renuevan: function(){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('renuevan');
    $('#mainSectionTitle').html('Cambian la fecha de vencimiento');
    App.Models.listRenuevan = new listRenuevanModel();
    App.Models.listRenuevan.getDomains();
    App.Views.listRenuevan = new tableView({model: App.Models.listRenuevan.get('tableModel')});
    App.Views.listRenuevan.render();
    touchAnalytics('/renuevan', 'Renuevan ');
    
  },

  ultimosRegistrados: function(status){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('ultimosRegistrados');
    $('#mainSectionTitle').html('Ultimos dominios registrados');
    App.Models.ultimosRegistrados = new listUltimosRegistradosModel();
    App.Models.ultimosRegistrados.getDomains();
    App.Views.ultimosRegistrados = new tableView({model: App.Models.ultimosRegistrados.get('tableModel')});
    App.Views.ultimosRegistrados.render();
    touchAnalytics('/ultimosRegistrados', 'ultimos registrados ' + status);
    
  },

  mayoresRegistrantes: function(desde, hasta){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('mayoresRegistrantes');
    title = 'Mayores registrantes';
    if (desde) {title = title + " desde " + desde;}
    else {desde = '1996-01-01';}

    if (hasta){title = title + " hasta " + hasta;}
    else {
        var myDate = new Date();
        hasta = myDate.getFullYear()+'-'+ (myDate.getMonth() + 1) +'-'+myDate.getDate();
        }
    $('#mainSectionTitle').html(title);
    App.Models.mayoresRegistrantes = new listMayoresRegistrantesModel();
    App.Models.mayoresRegistrantes.getDomains(desde, hasta);
    App.Views.mayoresRegistrantes = new tableView({model: App.Models.mayoresRegistrantes.get('tableModel')});
    App.Views.mayoresRegistrantes.render();
    touchAnalytics('/mayoresRegistrantes', 'mayores registrantes ' + status);
    
  },

  enTramiteDeAlta: function(status){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('enTramiteDeAlta');
    $('#mainSectionTitle').html('Dominios en trámite de alta');
    App.Models.listEnTramiteDeAlta = new listEnTramiteDeAltaModel();
    App.Models.listEnTramiteDeAlta.getDomains();
    App.Views.listEnTramiteDeAlta = new tableView({model: App.Models.listEnTramiteDeAlta.get('tableModel')});
    App.Views.listEnTramiteDeAlta.render();
    touchAnalytics('/enTramiteDeAlta', 'En tramite de alta ' + status);
    
  },

  vencenHoy: function(){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('vencenHoy');
    $('#mainSectionTitle').html('Vencen Hoy');
    App.Models.vencenHoy = new listVencenHoyModel();
    App.Models.vencenHoy.getDomains();
    App.Views.vencenHoy = new tableView({model: App.Models.vencenHoy.get('tableModel')});
    App.Views.vencenHoy.render();
    touchAnalytics('/vencenHoy', 'vencen hoy');
    
  },

  dominiosAntiguos: function(){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('dominiosAntiguos');
    $('#mainSectionTitle').html('Dominios mas antiguos');
    App.Models.dominiosAntiguos = new listDominiosAntiguosModel();
    App.Models.dominiosAntiguos.getDomains();
    App.Views.dominiosAntiguos = new tableView({model: App.Models.dominiosAntiguos.get('tableModel')});
    App.Views.dominiosAntiguos.render();
    touchAnalytics('/dominiosAntiguos', 'dominios antiguos');
    
  },

  listByRegistrants: function(reg, name){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('list by registrants:' + reg);
    $('#mainSectionTitle').html('Dominios por registrante');
    App.Models.listByRegistrants = new listByRegistrantsModel({reg:reg, name:name});
    App.Models.listByRegistrants.getDomains();
    App.Views.listByRegistrants = new tableView({model: App.Models.listByRegistrants.get('tableModel')});
    App.Views.listByRegistrants.render();
    touchAnalytics('/listByRegistrants', 'list By Registrants ' + reg + ' : ' + name);
    
  },

  registrants: function(reg){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('registrants:' + reg);
    $('#mainSectionTitle').html('Dominios por registrante');
    App.Models.registrants = new registrantsModel({reg:reg});
    App.Models.registrants.getRegistrants();
    App.Views.registrants = new tableView({model: App.Models.registrants.get('tableModel')});
    App.Views.registrants.render();
    touchAnalytics('/registrants', 'registrants ' + reg);
    
  },

  search: function(query, searchType){
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('search', query);
    if (query == 'logs2014')
        {
        $('#panelPrimary').html(App.Logs);
        return;
        }
    $('#mainSectionTitle').html('Búsqueda');
    App.Models.listBySearch = new listSearchModel({query: query, searchType: searchType});
    App.Models.listBySearch.getDomains();
    App.Views.listBySearch = new tableView({model: App.Models.listBySearch.get('tableModel')});
    App.Views.listBySearch.render();
    touchAnalytics('/search', 'search ' + query + ' : ' + searchType);
    
  },

  about: function() {
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('about ArNicApp');
    $('#mainSectionTitle').html('Acerca de ArNicApp');
    App.Views.about = new aboutView({}); // datos generales sobre un dominio, autoinicializado
    touchAnalytics('/about', 'about');
    
    },

   especiales: function() {
    showLoading();
    navbarCollapse();
    
    //appEvents.trigger('especiales');
    $('#mainSectionTitle').html('Servicios especiales');
    App.Views.about = new especialesView({}); // datos generales sobre un dominio, autoinicializado
    touchAnalytics('/especiales', 'especiales');
    
    },

  default: function(other) {
    showLoading();
    alert("fail");
    
  }

});

new App.Router;
Backbone.history.start();