# medusapp
Medusa App

# Entorno
Se detallan a continuacion los requisitos y el proceso de alta del entorno de trabajo
para Ubuntu. De todas formas es facilmente replicable en otro sistemas  

# Incializar entorno
Instalar apache2, php5, mysql-server  
Crear una base de datos llamada **pactointegridad**  
Asignarle permisos a un usuario en MySql e indicarlo en el archico application/config/database.php (que debe crearse como copia de database-sample.php)  
  
```php  
$db['default'] = array(  
	'dsn'	=> '',  
	'hostname' => 'localhost',  
	'username' => 'your-user',  
	'password' => 'your-pass',  
	'database' => 'pactointegridad',  
```  
  
Cargar a la base de datos el contenido de **sql/pactointegridad.sql** e **sql/initial.sql**  

# Preparar host de trabajo
Por cuestion de paths internos es necesario tener un dominio interno para pruebas  
Para este ejemplo se usa un host hacia la url *http://medusapp*  
Agregar al archivo */etc/hosts* la linea
```bash
127.0.0.1	medusapp  
```  

**Host de apache** (se podría *nginx* u otros)  
```bash
<VirtualHost *:80>
	ServerName medusapp

	ServerAdmin andres@data99.com.ar
	DocumentRoot /home/casa/dev/medusapp

	LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/medusapp-error.log
	CustomLog ${APACHE_LOG_DIR}/medusapp-access.log combined

	<Directory /home/casa/dev/medusapp/>

        	Options Indexes FollowSymLinks
		Require all granted
		AllowOverride All
	</Directory>

</VirtualHost>
```  
