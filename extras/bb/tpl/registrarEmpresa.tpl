<div class="row">
	<div class="span10 offset1">
		<%= registroTexto %>
	</div>
</div>

<div class="row">
  <div class="span6 offset3">
    <h4 class="widget-header"><i class="icon-form"></i> Formulario de registro de empresas</h4>
    <div class="widget-body">
      <div class="center-align" id='registrarEmpresaFormContainer'>
        <form class="form-horizontal form-signin-signup" id='registrarEmpresaForm'>

          <input type="text" placeholder='Razon Social' name="razonsocial" id="razonsocial" required>

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

          <input type="text" placeholder='CUIT o identificador tributario' name="cuit" id="cuit" required>
          
          <input type="text" placeholder='Nombre del responsable' name="nombre" id="nombre" required>
          <input type="text" placeholder='Apellido del responsable' id="apellido" name="apellido" required>
          <input type="text" placeholder='email' id="email" name="email" class="email" required>
          
        
      </form>
        
        <div>
          <button class="btn btn-primary btn-large" id='registrar'>Registrarse</button>
        </div>

      </div>        

    </div>
  </div>
</div>