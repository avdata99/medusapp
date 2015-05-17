<!-- <link href="//cdn-images.mailchimp.com/embedcode/classic-081711.css" rel="stylesheet" type="text/css"> -->
<div class="row">
  <div class="span6 offset3">
    <!-- <h4 class="widget-header"><i class="icon-suscribe"></i> Sumate!</h4> -->
    <div class="widget-body">
      <div class="center-align" id="mc_embed_signup">
        <form 
        action="<%= mailchimp_action_url %>" 
        method="post" 
        id="mc-embedded-subscribe-form" 
        name="mc-embedded-subscribe-form" 
        class="validate form-horizontal form-signin-signup" 
        novalidate>

          <input type="text" placeholder='email' value="" name="EMAIL" class="required email" id="mce-EMAIL">
          <div class="mc-field-group">
            <label for="mce-MMERGE4">Sector</label>
            <select name="MMERGE4" class="required" id="mce-MMERGE4">
              <option value="ONG">ONG</option>
              <option value="Gobierno">Gobierno</option>
              <option value="Empresa">Empresa</option>
              <option value="Ciudadano">Ciudadano</option>
            </select>
          </div>

          <input type="text" placeholder='Nombre' value="" name="FNAME" class="" id="mce-FNAME">
          <input type="text" placeholder='Apellido' value="" name="LNAME" class="" id="mce-LNAME">

          


          <div>
            <input type="submit" id='mc-embedded-subscribe' value="Registrarse" class="btn btn-primary btn-large">
          </div>


          <div style="position: absolute; left: -5000px;">
            <input type="text" name="b_7f72f6878941580f6affb71a0_2d22ce24ef" tabindex="-1" value="">
          </div>
        </form>

      </div>
      <div id="mce-responses" class="clear">
        <div class="response" id="mce-error-response" style="display:none"></div>
        <div class="response" id="mce-success-response" style="display:none"></div>
      </div>
        

    </div>
  </div>
</div>