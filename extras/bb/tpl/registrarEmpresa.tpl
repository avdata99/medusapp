<div class="row">
	<div class="span10 offset1">
		<%= registroTexto %>
	</div>
</div>

<div class="row">
  <div class="span6 offset3">
    <h4 class="widget-header"><i class="icon-form"></i> Formulario de registro</h4>
    <div class="widget-body">
      <div class="center-align" >
        <div class="validate form-horizontal form-signin-signup">

          <input type="text" placeholder='Razon Social' name="razonsocial" id="razonsocial" class="required">

          <div class="mc-field-group">
            <label for="pais">País</label>
            <select name="pais">
              <option>Argentina</option>
              <option>Chile</option>
              <option>Uruguay</option>
              <option>Paraguay</option>
              <option>Brasil</option>
              <option>Otros</option>
            </select>
          </div>

          <input type="text" placeholder='CUIT o identificador tributario' name="cuit" id="cuit" class="required">
          
          <input type="text" placeholder='Nombre del responsable' name="nombre" id="nombre" class="">
          <input type="text" placeholder='Apellido del responsable' id="apellido" name="apellido" class="">
          <input type="text" placeholder='email' id="email" name="email" class="required email">
          
          <div>
            <button class="btn btn-primary btn-large" id='registrar'>Registrarse</button>
          </div>

        </div>

      </div>        

    </div>
  </div>
</div>