<?php
class publicacionesc  extends controlador
{

public function __construct(){
	
	parent::__construct();
}

public function index(){
/***************************************************/
$this->vista->eti('usuario',$_SESSION['user']);
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
/***************************************************/
if($total>=1){
$no=$this->modelo->no($limit,$from,$orden,$buscar,$categoria,$id);	
$dios=['titulo'=>['co','titulo'],'categoria'=>['co','categoria'],'publicado'=>['co','publicado'],'user'=>['co','user'],'visitas'=>['co','visitas'],'comentarios'=>['co','comentarios'],'img[@class="imart aim"]'=>['src','foto'],'h6[@class="atitle"]'=>['title','titulo'],'a[@class="ai boton"]'=>['href','id','/editar?i='],'a[@class="boton br"]'=>['href','id','/publicaciones/eliminar?i=']];

$this->vista->each('a1',$no,$dios);	
}else{
	$this->vista->remove('paginador');
$this->vista->remove('a1');
$this->vista->cont('noticia','<center><h2>no se encontraron resultados</h2></center>');

}
/*************************************************/
$categoria=$this->modelo->categorias();
$cata=['cate'=>['co','categoria'],'a[@class="idcat"]'=>['href','categoria','/?c=']];
$this->vista->each('catet',$categoria,$cata);
// /**************************************************/
if (!isset($_GET["i"])&&$total>1) {
	
	$this->vista->cont('pgt',$pagina);
$sig=$pagina+1;$ant=$pagina-1;
$this->vista->set('a[@id="1"]','href',"/publicaciones?p=1&co=$orden&lt=$limit");
$this->vista->set('a[@id="2"]','href',"/publicaciones?p=$ant&co=$orden&lt=$limit");
$this->vista->set('a[@id="3"]','href',"/publicaciones?p=$sig&co=$orden&lt=$limit");
$this->vista->set('a[@id="4"]','href',"/publicaciones?p=$total&co=$orden&lt=$limit");
if($total>=1){
if($pagina==1){ $this->vista->set('li[@id="1"]','style','display:none'); }
if($pagina<=2){ $this->vista->set('li[@id="2"]','style','display:none'); }
if($pagina==$total){ $this->vista->set('li[@id="3"]','style','display:none'); }
if($pagina==$total){ $this->vista->set('li[@id="4"]','style','display:none'); }
} 	
}else{$this->vista->remove('paginador');$this->vista->remove('limite');}

$this->vista->ver();
}//FIN INDEX


} 

?>