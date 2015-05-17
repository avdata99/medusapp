var mailChimpModel = Backbone.Model.extend({
	defaults: {
		mailchimp_action_url: App.social_values.mailchimp_action_url,
	}
});

var mailChimpView = Backbone.View.extend({
    template: template('mailChimpForm2'),
    render: function(){
        $('#main_title').html('Susucribirse <small>novedades de MedusApp</small>');
        var tpl = this.template(this.model.toJSON());
        $('#main_container').append(tpl);
        return this;
        },
    });