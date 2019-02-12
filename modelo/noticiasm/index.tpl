<?php
class noticiasm extends Modelo{
    public function __construct() { parent::__construct(); }

    public function pag($limit,$buscar="",$categoria=""){

    $sql="SELECT COUNT(*) as num FROM noticias ";
    if(!empty($buscar)){$sql.="WHERE titulo LIKE '%".$buscar."%'";}
    if(!empty($categoria)){$sql.="WHERE categoria='$categoria'";}
    $sql.="ORDER BY id DESC";

    $query=$this->conexion->query($sql);
    $total_results=$query->fetch();
    $total_pages=ceil($total_results['num'] / $limit);
    return $total_pages; }

    public function no($limit,$pages,$orden,$buscar="",$categoria="",$id=""){

    if($orden==2){ $ordenar="id DESC"; }else{ $ordenar="id ASC"; }
    
    $sql="SELECT id,titulo,foto,";
    if($id==""){ $sql.="contenido"; }else{ $sql.="contenido"; }
    
    $sql.=",user,categoria,visitas,publicado,comentarios FROM noticias ";
    if(!empty($buscar)){$sql.="WHERE titulo LIKE '%".$buscar."%'";}
    if(!empty($categoria)){$sql.="WHERE categoria='$categoria'";}
    if(!empty($id)){$sql.="WHERE id='$id'";}

    if(isset($_SESSION['user'])&&$_SESSION['role']!='administrador'){ if(isset($_SESSION['user'])){ $user = $_SESSION['user']; } if(!empty($user)){$sql.="WHERE user='$user'";} }

    $sql.="ORDER BY $ordenar LIMIT $pages,$limit";
    $query=$this->prepara($sql);
    return $query; }

    public function categorias(){ $query=$this->prepara("SELECT * FROM categoria ORDER BY id ASC");return $query; }

    public function comentario(){ return $this->prepara("SELECT id,SUBSTRING(comentario,1,250) as comentario,autor,foto,publicado,correo,categoria,id_contenido FROM comentario limit 5"); }

    public function categoriasid($id){
    $query = $this->prepare("SELECT * FROM noticias WHERE id=:id");
    $query->bindParam(':id', $id, PDO::PARAM_INT);
    $query->execute();
    return $query->fetchAll(); }

    public function comxid($id){
    $query = $this->prepare("SELECT * FROM comentario WHERE id_contenido=:id");
    $query->bindParam(':id', $id, PDO::PARAM_INT);
    $query->execute();
    return $query->fetchAll(); }

} ?>
