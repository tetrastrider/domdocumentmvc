<?php

class iniciom extends Modelo
{
    public function __construct() {
        parent::__construct();
    }

    public function ultimas()

  {
  $query = $this->conexion->query("SELECT * FROM noticias ORDER BY id DESC LIMIT 5");
  return $query;
  }

  public function antigua()

  {
  $query = $this->conexion->query("SELECT * FROM noticias ORDER BY id ASC LIMIT 5");
  return $query;
  }

}

?>
