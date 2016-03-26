<?php
/* my config values */
# se usa como $this->config->item('app_url_web')

# nombre de la app para titulos
$config['app_name_short'] = 'MedusApp';
if (ENVIRONMENT == "production") {
	$config['app_url_admin'] = 'https://MedusApp.org/home';
	$config['app_url_web'] = 'https://MedusApp.org';
	}
else {
	$config['app_url_admin'] = 'http://MedusApp/home';
	$config['app_url_web'] = 'http://MedusApp';
}
# carpeta donde se almacenan los documentos principales de cada licitacion
# asegurarse permisos
$config['upload_documents'] = 'static/documents'; # documentos de info de las licitaciones 
$config['upload_images'] = 'static/images'; # imagenes usadas para las licitaciones
$config['upload_documentos_empresas'] = 'static/company_documents'; 
$config['upload_documentos_observadores'] = 'static/observador_documentos';
$config['upload_fotos_observadores'] = 'static/observador_foto';
$config['upload_documentos_cierre'] = 'static/documentos_cierre'; #documentos de cierre de la licitacion
$config['upload_logo_gobiernos'] = 'static/gobiernos_logo';

$config['environment'] = ENVIRONMENT;


?>