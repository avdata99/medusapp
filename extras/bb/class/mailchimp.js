var mailChimpView = Backbone.View.extend({
    template: template('mailChimpForm2'),
    render: function(){
        $('#main_title').html('Susucribirse <small>novedades de MedusApp</small>');
        var tpl = this.template();
        $('#main_container').append(tpl);
        return this;
        },
    });