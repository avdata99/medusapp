/** cada licitacion*/
var footerModel = Backbone.Model.extend({
    defaults: {
        twitter_account: null,
        facebook_account: null,
        mail_show: null,
        developed_by_txt: null,
        developed_by_url: null,
    },
    getSocialValues: function(){
        self = this;
        var url = App.Configuration.Api + '/info/social';
        var xhr = $.ajax({
            url: url,
            type: 'GET',
            async: false});
        
      xhr.done(function(data){ // get social info
        _.each(data, function(social){
            self.set(social.social_name, social.social_value);
            });
        });
      xhr.fail(function(data){console.log("failed on getLicitacionLanding");});
    }
});

var footerView = Backbone.View.extend({
    el: '#footer',
    template: template('footer'),
    render: function(){
        this.model.getSocialValues();
        var tpl = this.template(this.model.toJSON());
        this.$el.html(tpl);
        return this;
        },
    });
