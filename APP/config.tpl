<?php
// $CONFIG=parse_ini_file(APP_RUTA.'config.ini');
/*************control**********************************/
CONST ERROR = false;//if true pagina de error if false redireccionar
CONST PRROR = 'error';//pagina de error
CONST METODOHOME = 'index';//metodo por defecto
CONST DEV = true;//desarrollo php
CONST DEVJS = false;//desarrollo js
CONST HOME  ='noticias';//pagina de inicio
CONST TEMA  ='simple';//default,simple
CONST PRIVADO = array('administrador','publicaciones','registro','portada','editar');//control acceso
/***************BASE DE DATOS***************************************/
CONST DRIVER = 'mysql';
CONST BD_SERVIDOR = '127.0.0.1';
CONST BD_NOMBRE='standart';
CONST BD_USUARIO = 'root';
CONST BD_PASSWORD = '';
/**************CORREO*********************************/
CONST CORREOLOCAL = 'alexanderbrache@gmail.com';//correo
CONST SUBJECT = 'correo de overclocktech';//asunto
/***********DEFAULT ESTILOS**********************************/
CONST ADMINESTILO = 'admin.css';
CONST NORMALESTILO = 'estilos.css';
CONST EXT = '.tpl';//extencion
/**********************************************************/
CONST MODELO = RAIZ.'modelo'.DS;//ruta carpeta modelo
CONST VISTAS = RAIZ.'vistas'.DS;//ruta carpeta vistas
CONST CONTROL = RAIZ.'control'.DS;//ruta carpeta controles
CONST MAQUETAS = RAIZ.'maqueta'.DS;//ruta carpeta maqueta
CONST DOM = 'true';//cargar js desde carpeta dom segun control y metodo
CONST DOMDIR = 'dom';//directorio dom con js
CONST CZ = 'cabeza';//cabezera
CONST PE = 'pie';//pie
CONST CZA = 'acabeza';//cabezera admin
CONST PEA = 'apie';//pie admin
CONST PERMITIDOS='<p><a><h1><h2><h3><h4><h5><h6><b><a><img><ul><li><div><span><hr><small><pre><code><strong><br><ol><ul>';//etiquetas permitidas
?>
