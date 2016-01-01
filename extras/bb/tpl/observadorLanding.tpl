<div class="row">
	<div class="span9">
		<img src="/static/observador_foto/<%= foto %>" class="thumbnail float-30">
		<%= descripcion %>
	</div>
	<div class="span2">
		<a target='_blank' href="/static/observador_documentos/<%= documento_url %>" class="btn btn-primary">Descargar CV</a>
	</div>
</div>

<div class="row">
	<div class="span12">
	<h3>Licitaciones observadas de <%= nombre %> en MedusApp</h3>
	<% if (_.size(licitaciones) > 0) { %>
		<% _.each(licitaciones, function(licitacion) { %>
		
		<p><b><%= licitacion.titulo %></b>. <%= licitacion.descripcion %>
		<a href='/#licitacion/<%= licitacion.uid %>' target='_blank'>Ver datos de la licitación</a> </p>
		
		<% }); %>
		<% } else { %>
			<p>No ha observado licitaciones aún</p>
		<% } %>	

	</div>
</div>

