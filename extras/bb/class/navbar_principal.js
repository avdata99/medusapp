/** cada licitacion*/
var navbar_principalModel = Backbone.Model.extend({
    defaults: {
        titulo: 'Pactos de información',
    }
});

var navbar_principalView = Backbone.View.extend({
    el: '#navbar_principal',
    template: template('navbar_principal'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.html(tpl);
        return this;
        },
    });
