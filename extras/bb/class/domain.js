var domainsModel = Backbone.Model.extend({
	defaults:{
		dominio: '', //initial required data
		info:null, //full domain info
		scrapes: [], //scrapes dates
		pings: [], //full pings for 80's port
		history_changes: [], //full history's changes

		panels: [], // one panel for state
		},
	initialize: function(){
		this.getDomain(this.get('dominio'));
	},

	getDomain: function(domain){
		self = this; 
		var url = App.Configuration.Api + '/dominios/dominio/nombre/'+domain+'/format/json';
		var xhr = $.ajax({
	        url: url,
	        type: 'GET',
	        //data: {data: self.attributes},
	        async: false});
	    
      xhr.done(function(data){ // get extra info
        var panels = []; //clear
        var dom = data.result.dominio[0];
        self.set('info', dom);
        /*
        {
        "id": "526317",
        "dominio": "unquillo.com.ar",
        "registrante": "Andres Vazquez",
        "reg_razon_social": "",
        "estado": "no disponible",
        "desde": "2014-10-13",
        "hasta": "2015-10-13",
        "DNS1": "ns1.unfollow.net",
        "DNS2": "ns2.unfollow.net",
        "DNS3": "",
        "DNS4": "",
        "lastUpdated": "2014-10-14 08:52:00"
        }
		*/
		hist =  data.result.history_changes;
        self.set('scrapes', data.result.scrapes); // [{"fecha": "2014-10-14 08:52:00"},{"fecha": "2014-10-13 17:39:32"},]
        self.set('pings', data.result.pings); // [{"fecha": "2014-10-28 00:08:58","dns": "1","puerto80": "1"}
        self.set('history_changes',hist);
        /*
        {fecha:2014-09-14 00:40:31, campo:DNS2, anterior:ns2.exoclick.com, nuevo:ns4.hostmar.com}
		, {fecha:2014-09-14 00:40:31, campo:DNS1, anterior:ns1.exoclick.com, nuevo:ns3.hostmar.com}
		, {fecha:2014-09-14 00:40:31, campo:hasta, anterior:2012-10-10, nuevo:2014-10-10}
		, {fecha:2011-10-10 06:01:19, campo:hasta, anterior:2011-10-10, nuevo:2012-10-10}
		*/
        // one panel for each info
    	var panels = [];

    	// general panel
    	var details = '<b>Registrante:</b> ';
        var reg = dom.registrante;
    	if (dom.reg_razon_social != '') reg = dom.reg_razon_social + ' [empresa]';
        if (dom.reg_documento != '') reg = '<a href="#listByRegistrants/'+dom.reg_documento+'/'+reg+'">'+reg+'</a>'
        details += reg;
        details += '<br/><b>Estado: </b>' + dom.estado;
    	details += '<br/><b>Registrado desde: </b>' + dom.desde;
    	details += '<br/><b>Vence: </b>' + dom.hasta;
    	details += '<br/><b>DNS 1: </b>' + dom.DNS1;
    	details += '<br/><b>DNS 2: </b>' + dom.DNS2;
    	details += '<br/><b>DNS 3: </b>' + dom.DNS3;
    	details += '<br/><b>DNS 4: </b>' + dom.DNS4;
    	
    	panels.push(new miniPanelModel({
			color: 'panel-primary', //panel-primary, panel-green, panel-yellow
			text: details, title: dom.dominio, footer: 'Updated: ' + dom.lastUpdated
			}));

    	// history panel
    	details = '';
    	lastFecha = '';
    	_.each(hist, function(h){
    		if (lastFecha != h.fecha && lastFecha != '')
                details += '<hr><b>'+h.fecha+'</b><br/>';
            if (lastFecha == '')
                details += '<b>'+h.fecha+'</b><br/>';
            	
    		if (h.nuevo == '') h.nuevo = '(vacío)';
            if (h.anterior == '') h.anterior = '(vacío)';
            if (h.campo == 'reg_razon_social') h.campo = 'Razón social';
            if (h.campo == 'fecha_reserva') h.campo = 'Fecha de reserva';
            
            details += '<b>'+h.campo + '</b> cambio de <b><i>' + h.anterior + '</i></b> a <b><i>' + h.nuevo + '</i></b><br/>';
    		lastFecha = h.fecha;
    	});
    	
    	panels.push(new miniPanelModel({
			color: 'panel-success', panelWidth:8, 
			text: details, title: 'Historia', footer: 'Cambios detectados en base a las fechas de scrapes. No es la historia completa'
			}));



        self.set('panels', panels);
        });
      xhr.fail(function(data){
        console.log("failed on DomainsByStates");
        });
	},

	
});