<li class="span4">
  <div class="thumbnail">
    <img src="/static/images/<%= imagen %>" alt="Licitacion <%= gobierno %> - <%= titulo%>">
    <div class="caption">
      <h3><%= gobierno %> | <%= titulo %></h3>
      <p><%= descripcion %></p>
    </div>
    <div class="widget-footer">
      <p>
        <a href="<%= url %>" class="btn btn-primary">Comprar pliego</a>&nbsp;
        <a target='_blank' href="/static/documents/<%= documento %>" class="btn">Descargar PDF</a>
      </p>
    </div>
  </div>
</li>