/** cada licitacion*/
var footerModel = Backbone.Model.extend({
    defaults: {
        twitter: '@medusapp',
        facebook: 'medusaapp',
        email: 'info@medusapp.org',
    }
});

var footerView = Backbone.View.extend({
    el: '#footer',
    template: template('footer'),
    render: function(){
        var tpl = this.template(this.model.toJSON());
        this.$el.html(tpl);
        return this;
        },
    });
