<div class="row">
	<div class="span12">
		<img src="/static/gobiernos_logo/<%= logo %>" class="thumbnail float-30">
		<%= texto_presentacion %>
	</div>
</div>

<div class="row">
	<div class="span12">
	<h3>Licitaciones de <%= nombre %> en MedusApp</h3>
	<% if (_.size(licitaciones) > 0) { %>
		<% _.each(licitaciones, function(licitacion) { %>
		<p><b><%= licitacion.titulo %></b></p>. <%= licitacion.descripcion %>
		<% }); %>
		<% } else { %>
			<p>No hay licitaciones aún</p>
		<% } %>	

	</div>
</div>

