### Manual de uso
    
Destinado a los usuarios por tipo (municipios, empresas, observadores, ciudadanos o administradores).  
Desarrollado con [Sphinx](http://sphinx-doc.org/). El directorio *docs/source* guarda los textos en *rst* y con el comando
``` bash
sphinx-build -b html docs/source manual
``` 
se genera el manual en HTML. Estamos usando el template de [Read The Docs](https://readthedocs.org).  
Esto permite que el directorio [manual](http://medusapp.org/manual) muestre al público todo el contenido.  
Es por esto que el directorio *manual* **nunca** debe editarse manualmente ya que es contenido auto-generado.  

![Sistema](/../master/static/img/screen-medusapp-02-manual-small.png?raw=true)
