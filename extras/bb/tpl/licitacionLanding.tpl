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
	    <h3>Documentos pedidos por el gobierno</h3>
	    <p>Al iniciar el proceso el Gobierno define que documentos solicitará liberar
	     a las empresas participantes. Estos fueron los documentos solicitados:</p>
	     <ul> 
	     	<% _.each(datos_pedidos, function(pedido) { %>
	     	<li><%= pedido.titulo %></li>
	     	<% }); %>
	     </ul>
		<h3>Documentos liberados por las empresas participantes</h3>
		<% if (_.size(datos_entregados) > 0) { %>
		<ul>
		<% _.each(datos_entregados, function(datos_entregado) { %>
		<li><%= datos_entregado.empresa %> entrego <%= datos_entregado.documento %></li>
		<% if (datos_entregado.url) { %>
		<a target='_blank' class="btn" 
			href="/static/company_documents/<%= datos_entregado.url %>">Descargar <%= datos_entregado.documento %> de <%= datos_entregado.empresa %>  </a>
		
		<% } else { %>
		<p><b>DOCUMENTO NO LIBERADO</b></p>
		<% } %>

		<% if (datos_entregado.observaciones) { %>
		<p><b>Observaciones de la empresa:</b> <%= datos_entregado.observaciones %></p>
		
		<% } else { %>
		
		<p><b>SIN Observaciones de la empresa</b></p>
		<% } %>
		
		<% }); %>
		</ul>
	<% } else { %>
		<p>Ninguna empresa libero alguno de los datos solicitados</p>
	<% } %>	
	</div>
</div>

<div class="row">
	<div class="span12">
		<h3>Inicio de la licitación</h3>
		<p>Fecha de inicio: <%= fecha_inicio %></p>
		<h3>Cierre de la licitación</h3>
		<p>Fecha de cierre: <%= fecha_fin %></p>
	</div>
</div>

<div class="row">
	<div class="span12">
		<h3>Eventos de la licitación</h3>
		
		<% if (_.size(eventos) > 0) { %>
		
		<% _.each(eventos, function(evento) { %>
		<p><b><%= evento.titulo %></b> (<%= evento.fecha %>) <%= evento.descripcion %></p>
		<% }); %>
		
		<% } else { %>
		<p><b>No hubo eventos en esta licitación aún</b></p>
		<% } %>

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

