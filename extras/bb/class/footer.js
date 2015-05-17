/** cada licitacion*/
var footerModel = Backbone.Model.extend({
    defaults: {
        twitter_account: App.social_values.twitter_account,
        facebook_account: App.social_values.facebook_account,
        mail_show: App.social_values.mail_show,
        developed_by_txt: App.social_values.developed_by_txt,
        developed_by_url: App.social_values.developed_by_url,
    },
    
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
