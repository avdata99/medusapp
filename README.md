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

