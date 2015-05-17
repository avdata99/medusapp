# MedusApp
Aplicación para la gestion de licitaciones públicas y concursos de precios.  
  
# Componentes
MedusApp esta compuesta por dos aplicaciones.  
**Backend**  
Este incluye la carga de datos del sistema: licitaciones, gobiernos, usuarios, etc.  

Hecho con Codeigniter 3 (PHP 5) con las librerías:  
- [Rest Server](https://github.com/chriskacerguis/codeigniter-restserver) para el API.  
- [Grocery Crud](http://www.grocerycrud.com/) para la carga rápida de datos.  
  
Esta aplicación esta contenida en el directorio *application* y esta inicializada con el archivo **ci.php** (al que se dirigen lo llamados vía *.htaccess*).  
  
**Web site**  
Aplicacion HTML5 + Backbone para publicación de datos.  
Consume vía API todos los datos necesarios para poder embeberse como aplicación mobile Phonegap.  
Template: [BootBusiness](http://demo.firebootstrap.com/themes/bootstrap/bootbusiness/contact_us.html)  
  
Esta aplicación comienda en */index.html* y routea las URLs desde */routes.js*. Las librerías backbone y los templates estan en el directorio */extras/bb*.  
  
# Entorno
Se detallan a continuacion los requisitos y el proceso de alta del entorno de trabajo
para Ubuntu. De todas formas es facilmente replicable en otro sistemas.  

# Incializar entorno
Instalar apache2, php5, mysql-server  
Crear una base de datos llamada **pactointegridad**.  
Asignarle permisos a un usuario en MySql e indicarlo en el archico application/config/database.php (que debe crearse como copia de database-sample.php).  
  
```php  
$db['default'] = array(  
	'dsn'	=> '',  
	'hostname' => 'localhost',  
	'username' => 'your-user',  
	'password' => 'your-pass',  
	'database' => 'pactointegridad',  
```  
  
Cargar a la base de datos el contenido de **sql/pactointegridad.sql** e **sql/initial.sql**.  

# Preparar host de trabajo
Por cuestion de paths internos es necesario tener un dominio local para pruebas.  
Para este ejemplo se usa un host hacia la url *http://medusapp*.  
Agregar al archivo */etc/hosts* la linea:  
```
127.0.0.1	medusapp  
```  

**Host de apache** (se podría *nginx* u otros):    
```
<VirtualHost *:80>
	ServerName medusapp

	ServerAdmin you@domain.com
	DocumentRoot /path/to/medusapp

	LogLevel info 

	ErrorLog ${APACHE_LOG_DIR}/medusapp-error.log
	CustomLog ${APACHE_LOG_DIR}/medusapp-access.log combined

	<Directory /path/to/medusapp/>
        Options Indexes FollowSymLinks
		Require all granted
		AllowOverride All
	</Directory>

</VirtualHost>
```  
Asegurarse de activar el modulo *rewrite*.  
```
sudo a2enmod rewrite
```
Asegurese de tener activados los tags cortos de php (*<?* con *short_open_tag = On*).  
Luego de reiniciar apache la url [http://medusapp/home](http://medusapp/home) ya debe funcionar.  
El usuario y clave prederteminados para el *backend* son *admin* + *admin*.  
En [medusapp/](http://medusapp/) estará visible el sitio web público.  



