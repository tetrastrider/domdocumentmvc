<?php

class registrom extends Modelo
{
  public function __construct() { parent::__construct(); }

  public function usuarios(){ $query=$this->prepara("SELECT * FROM usuarios ORDER BY usuario ASC");  return $query;}

	public function verbasededatos(){ $query=$this->prepara("SHOW DATABASES");return $query; }

	public function tablas($bd){ $query= $this->query("SHOW TABLES FROM $bd",PDO::FETCH_NUM)or die('error'); return $query; }

  public function creatabla($tabla,$comando){ $sql ="CREATE table $tabla($comando);"; $this->conexion->exec($sql); echo "TABLA $tabla SE CREO CON EXITO.\n"; }
  
  public function borrartabla($tabla){ $sql ="DROP TABLE $tabla;" ; $this->conexion->exec($sql); echo "TABLA $tabla SE BORRO CON EXITO.\n"; }

  public function comandosql($comando){ $this->conexion->exec($comando); }

	public function categorias(){	return $this->prepara('SELECT * FROM categoria'); }

	public function borracat($id){ $this->query("DELETE FROM categoria WHERE id=$id"); }

  public function estado($est){
    	$estado = $this->query("SELECT * FROM usuarios WHERE id_usuario=$est");
    	if($es=$estado->fetch()){
   		$activado = $es['activo'];
   		}

   		if ($activado=='activo') {
   			$shiftactivo='inactivo';
   		}else{
   			$shiftactivo='activo';
   		}

   		$this->query("UPDATE usuarios SET activo='$shiftactivo' WHERE id_usuario=$est")->execute();
    }

}

?>
