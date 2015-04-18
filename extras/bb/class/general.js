var generalModel = Backbone.Model.extend({
	defaults:{
		totalDomains:0,
		domainByStates: {},
		panelTotal: null, // a panel primary object
		panels: [], // one panel for state
		},
	initialize: function(){
		this.getDomainsByStates();
	},

	getDomainsByStates: function(){
		self = this;
		var url = App.Configuration.Api + '/app/porEstados/format/json';
		var xhr = $.ajax({
	        url: url,
	        type: 'GET',
	        //data: {data: self.attributes},
	        async: false});
	    
      xhr.done(function(data){ // get extra info
        var byStates = {};
        var total = 0;
        var panels = []; //clear
        _.each(data, function(doms){
        	byStates[doms.estado] = doms.total;
        	total = total + parseInt(doms.total);
        	panels.push( 
        		new panelPrimaryModel({
					color: 'panel-yellow', //panel-primary, panel-green, panel-yellow
					icon: 'fa-tasks', value: doms.total, title: doms.estado, url: '#listByStatus/' + doms.estado
					}));
        });
        self.set('panels', panels);
        self.set('domainByStates', byStates);
        self.set('totalDomains', total);
        self.set('panelTotal', new panelPrimaryModel({
			color: 'panel-red', //panel-primary, panel-green, panel-yellow
			icon: 'fa-tasks', value: total, title: 'Dominios', url: '#'
			}));
        self.trigger('updatedDomainsByStates');
        });
      xhr.fail(function(data){
        console.log("failed on DomainsByStates");
        });
	},

	
});