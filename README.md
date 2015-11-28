# MedusApp
Aplicación para la gestion de licitaciones públicas y concursos de precios.  
En activo desarrollo, producto no finalizado a cargo del Observatorio de Políticas Públicas de Universidad Católica de Córdoba.  
  
## Componentes
  
MedusApp esta compuesta por dos aplicaciones.  
  
### Backend  
  
Este incluye la carga de datos del sistema: licitaciones, gobiernos, usuarios, etc.  

Hecho con [Codeigniter 3](https://www.codeigniter.com/userguide3/) (PHP 5) con las librerías:  
- [Rest Server](https://github.com/chriskacerguis/codeigniter-restserver) para el API.  
- [Grocery Crud](http://www.grocerycrud.com/) para la carga rápida de datos.  
  
Esta aplicación esta contenida en el directorio *application* y esta inicializada con el archivo **ci.php** (al que se dirigen lo llamados vía *.htaccess*).  
Para la parte gráfica se usa el template [SB Admin 2](http://startbootstrap.com/template-overviews/sb-admin-2/).  

![Sistema](/../master/static/img/screen-medusapp-03-system-small.png?raw=true)
  
### Web site
  
Aplicacion HTML5 + Backbone para publicación de datos.  
Consume vía API todos los datos necesarios para poder embeberse como aplicación mobile Phonegap.  
Template: [BootBusiness](http://demo.firebootstrap.com/themes/bootstrap/bootbusiness/contact_us.html)  
![Web](/../master/static/img/screen-medusapp-01-home-small.png?raw=true)

Esta aplicación comienza en */index.html* y routea las URLs desde */routes.js*. Las librerías backbone y los templates estan en el directorio */extras/bb*.  
  
### Manual de uso

Desarrollado con [Sphinx](http://sphinx-doc.org/).  
[Ver más](https://github.com/avdata99/medusapp/tree/master/manual).  
![Sistema](/../master/static/img/screen-medusapp-02-manual-small.png?raw=true)

#### Entorno de desarrollo local

Para desarrollar se recomienda montar un entorno local de desarrollo.
[Instrucciones](https://github.com/avdata99/medusapp/blob/master/ENV.md)

#### Tests

Testear el funcionamiento. Ver [acá](https://github.com/avdata99/medusapp/blob/master/tests/)