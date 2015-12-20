<!-- datos generales de la licitacion -->
<div class="row">
	<div class="span9">
		<img src="/static/images/<%= imagen %>" class="thumbnail float-30">
		<%= descripcion %>
	</div>
    <div class="span3">
        <a target='_blank' class="btn btn-large btn-block" href="/static/documents/<%= documento %>">Descargar documento</a>
    </div>
</div>

<!-- datos del observador -->
<div class="row">
	<div class="span9">
		<h3>Observador: <b><%= observador%></b></h3>
		<p><%= observador_descripcion %></p>
	</div>
    <div class="span3">
        <a target='_blank' 
        	class="btn btn-large btn-block" 
        	href="/static/observador_documentos/<%= observador_documento %>">+ info del observador</a>
    </div>
</div>

