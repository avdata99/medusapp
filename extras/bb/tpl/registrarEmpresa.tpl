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
        <form action="" method="post" class="validate form-horizontal form-signin-signup" id='registrarEmpresa'>

          <input type="text" placeholder='Razon Social' value="" name="razonsocial" class="required">

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

          <input type="text" placeholder='CUIT o identificador tributario' value="" name="cuit" class="required">
          
          <input type="text" placeholder='Nombre del responsable' value="" name="nombre" class="">
          <input type="text" placeholder='Apellido del responsable' value="" name="apellido" class="">
          <input type="text" placeholder='email' value="" name="email" class="required email">
          
          <div>
            <input type="submit" value="Registrarse" class="btn btn-primary btn-large">
          </div>

        </form>

      </div>        

    </div>
  </div>
</div>

<script type="text/javascript">
	// mantener configurable la ubicacion del API para carga de datos
	$('#registrarEmpresa').attr('action', App.Configuration.Api + '/regsitrarEmpresa');
</script>


