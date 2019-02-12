<?php
class noticiasc  extends controlador
{

public function __construct(){ parent::__construct(); }

public function index(){

/***************************************************/
if(empty($_GET["b"])){$buscar="";}else{$buscar=$_GET["b"];}
if(empty($_GET['c'])){$categoria="";}else{$categoria=$_GET['c'];}
if(isset($_GET["i"])){if(!empty($_GET["i"])){(int)$id=(int)$_GET["i"];}}else{$id="";}
/******************************************************/
if(isset($_GET['p'])&&is_numeric($_GET['p'])){ $pagina=(int)$_GET['p'];$this->vista->set('input[@name="pG"]','value',$pagina); }else{ $pagina=1; $this->vista->set('input[@name="pG"]','value',$pagina);}
/****************************************************/
if(!isset($_GET['lt'])||!is_numeric($_GET['lt'])){ $limit=5;}else{ $limit=$_GET['lt'];}
/****************************************************/
 $from=(($pagina * $limit)- $limit);
/***************************************************/
 $total=$this->modelo->pag($limit,$buscar,$categoria);
/***************************************************/
if(!isset($_GET["co"])){

  $orden=2; //Publicaciones Nuevas
 
  $this->vista->set('option[@value="2"]','selected','selected');

}elseif($_GET["co"]==1){

  $orden=$_GET["co"]; $this->vista->set('option[@value="1"]','selected','selected');

}else{
  $orden=2; $this->vista->set('option[@value="2"]','selected','selected');
}
/****************************************************/
if($limit==5){
$this->vista->set('option[@value="5"]','selected','selected');
}elseif($limit==10){
$this->vista->set('option[@value="10"]','selected','selected');
}elseif($limit==15){
$this->vista->set('option[@value="15"]','selected','selected');
}elseif($limit==20){
$this->vista->set('option[@value="20"]','selected','selected');
}elseif($limit==25){
$this->vista->set('option[@value="25"]','selected','selected');
}elseif($limit==30){
$this->vista->set('option[@value="30"]','selected','selected');
}else{
$this->vista->set('option[@value="5"]','selected','selected');
}
/***/
/***************************************************/
$no=$this->modelo->no($limit,$from,$orden,$buscar,$categoria,$id);

if (isset($_GET["i"])) {
foreach($no as $data){
$this->vista->set('img[@id="im"]','src',$data['foto']);
$this->vista->set('h3[@id="title"]','title',$data['titulo']);
$this->vista->cont('title',$data['titulo']);
$this->vista->inner('contenido',$data['contenido']);
$this->vista->inner('publicado',$data['publicado']);
$this->vista->inner('user',$data['user']);
$this->vista->inner('visitas',$data['visitas']);
$this->vista->inner('comentarios',$data['comentarios']);
$this->vista->inner('categoria',$data['categoria']);

}
$this->vista->remove('a1');	
}else{

$dios=['titulo'=>['co','titulo'],'categoria'=>['co','categoria'],'publicado'=>['co','publicado'],'user'=>['co','user'],'contenido'=>['co','contenido'],'visitas'=>['co','visitas'],'comentarios'=>['co','comentarios'],'img[@class="imart aim"]'=>['src','foto'],'h3[@class="atitle"]'=>['title','titulo'],'a[@class="ai"]'=>['href','id','/?i=']];

$this->vista->each('a1',$no,$dios);

if($total>=1){	
$this->vista->remove('a2');	
}else{
$this->vista->remove('a1');$this->vista->remove('a2');$this->vista->cont('noticia','<center><h2>no se encontraron resultados</h2></center>');		
}
}
$cata=['cate'=>['co','categoria'],'a[@class="idcat"]'=>['href','categoria','/?c=']];
/*************************************************/
$categoria=$this->modelo->categorias();
$this->vista->each('catet',$categoria,$cata);
/***************************************************/
$uos=$this->modelo->comentario();
$u5=['a[@class="cref"]'=>['href','id_contenido','/?i='],'img[@class="fotocom"]'=>['src','foto','/'],'comen5'=>['co','comentario'],'autor5'=>['co','autor'],'public5'=>['co','publicado'],'catcom5'=>['co','categoria']];
$this->vista->each('com5',$uos,$u5);
 /**************************************************/
if (isset($_GET['i'])) {
$catxid=$this->modelo->categoriasid($id);
foreach($catxid as $catid){
$catidc = $catid['categoria'];
}
if (isset($_SESSION['user'])) {
$this->vista->set('input[@name="autor"]','value',$_SESSION['user']);
$this->vista->set('input[@name="autor"]','readonly','readonly');
$this->vista->set('input[@name="correo"]','value',$_SESSION['correo']);
$this->vista->set('input[@name="correo"]','readonly','readonly');
$this->vista->set('input[@name="id"]','value',$id);
$this->vista->set('input[@name="foto"]','value',$_SESSION['user'].'.gif');
$this->vista->set('input[@name="categoria"]','value',$catid['categoria']);
}else{
	$this->vista->set('input[@name="autor"]','value','');
	$this->vista->set('input[@name="autor"]','required','required');
	$this->vista->set('input[@name="correo"]','value','');
	$this->vista->set('input[@name="correo"]','required','required');
	$this->vista->set('input[@name="id"]','value',$id);
	$this->vista->set('input[@name="foto"]','value','anonimo.png');
	$this->vista->set('input[@name="categoria"]','value',''/*$catid['categoria']*/);
}

$comexid=$this->modelo->comxid($id);
if(count($comexid)!==0){

$cxi=['img[@class="fotocom fcxi"]'=>['src','foto','/'],'acxi'=>['co','autor'],'ccxi'=>['co','comentario'],'pcxi'=>['co','publicado'],'tcxi'=>['co','categoria']];
$this->vista->each('comxid',$comexid,$cxi);

}else{ $this->vista->remove('comid');}

}else{$this->vista->remove('com');}
 /**************************************************/	
if (!isset($_GET["i"])&&$total>1) {
	
	$this->vista->cont('pgt',$pagina);
$sig=$pagina+1;$ant=$pagina-1;
$this->vista->set('a[@id="1"]','href',"/?p=1&co=$orden&lt=$limit");
$this->vista->set('a[@id="2"]','href',"/?p=$ant&co=$orden&lt=$limit");
$this->vista->set('a[@id="3"]','href',"/?p=$sig&co=$orden&lt=$limit");
$this->vista->set('a[@id="4"]','href',"/?p=$total&co=$orden&lt=$limit");
if($total>=1){
if($pagina==1){ $this->vista->set('li[@id="1"]','style','display:none'); }
if($pagina<=2){ $this->vista->set('li[@id="2"]','style','display:none'); }
if($pagina==$total){ $this->vista->set('li[@id="3"]','style','display:none'); }
if($pagina==$total){ $this->vista->set('li[@id="4"]','style','display:none'); }
} 	
}else{$this->vista->remove('paginador');$this->vista->remove('limite');} 
$this->vista->ver();
}//FIN INDEX
} ?>