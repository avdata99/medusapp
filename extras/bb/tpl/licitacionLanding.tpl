<!-- datos generales de la licitacion -->
<div class="row">
	<div class="span9">
		<img src="/static/images/<%= imagen %>" class="thumbnail float-30">
		<%= descripcion %>
	</div>
	<% if (documento) { %>
    <div class="span3">
        <a target='_blank' class="btn btn-large btn-block" href="/static/documents/<%= documento %>">Descargar documento</a>
    </div>
    <% } %>
</div>

<!-- datos del observador -->
<div class="row">
	<div class="span9">
		<h3>Observador: <b><%= observador%></b></h3>
		<p><%= observador_descripcion %></p>
	</div>
	<% if (observador_documento) { %>
    <div class="span3">
        <a target='_blank' 
        	class="btn btn-large btn-block" 
        	href="/static/observador_documentos/<%= observador_documento %>">+ info del observador</a>
    </div>
    <% } %>
</div>

<!-- empresas postuladas -->

<div class="row">
	<div class="span12">
		<h3>Empresas postuladas a participar</h3>
	<% if (_.size(postulaciones) > 0) { %>
		<% _.each(postulaciones, function(postulacion) { %>
		<p><%= postulacion.empresa %></p>
		<% }); %>
	<% } else { %>
		<p>No hay empresas postuladas y aceptadas para participar aún</p>
	<% } %>	
	</div>
</div>

<div class="row">
	<div class="span12">
		<h3>Cierre de la licitacion</h3>
		<p>Fecha de cierre: <%= fecha_fin %></p>
	</div>
</div>

<div class="row">
	<div class="span9">
		<h3>Documento final del observador</h3>
		<p><%= cierre_observador_txt %></p>
	</div>
	<% if (cierre_observador_url) { %>
    <div class="span3">
        <a target='_blank' 
        	class="btn btn-large btn-block" 
        	href="/static/documentos_cierre/<%= cierre_observador_url %>">+ Documento de cierre del observador</a>
    </div>
    <% } %>	
</div>

