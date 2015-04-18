var aboutModel = Backbone.Model.extend({

	});

var aboutView = Backbone.View.extend({
	el: "#panelPrimary",
	template: template('about'),

	initialize: function(){
		this.render();
	},

	render: function(){
		this.$el.html(this.template());
		return this;
	}

});