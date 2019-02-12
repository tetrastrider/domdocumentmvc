<?php

class Modelo
{
    protected $conexion;
    private $dinamico = array();
    
    public function __construct() { $this->conexion = new basededatos(); }

    public function __set($name,$value){ $this->dinamico[$name] = $value; }

    public function __get($name){ return $this->dinamico[$name]; }

    public function __isset($name){ return isset($this->dinamico[$name]); }

    public function __unset($name){ unset($this->dinamico[$name]); }

    public function __toString(){ return $this->dinamico; }

    public function query($q){ $query=$this->conexion->query($q)or die('error'.$q); return $query;}

    public function prepare($p){ $query=$this->conexion->prepare($p); return $query; }

    public function prepara($p){ $query=$this->prepare($p); $query->execute(); return $query->fetchAll(); }

    public function selectall($a){return $this->prepara("SELECT * FROM ".$a);}

    public function obj($o){ $query=$this->prepare($o); $query->setFetchMode(PDO::FETCH_OBJ); $query->execute(); return $query->fetchAll(); }

    public function vago($v){ $vago = $this->prepare($v); $vago->execute(); return $vago->fetchAll(PDO::FETCH_LAZY); }

    public function ambos($a){ $ambos=$this->prepare($a); $ambos->execute(); return $ambos->fetchAll(PDO::FETCH_BOTH); }
    
    public function clase($c){$query=$this->query($c); $query->setFetchMode(PDO::FETCH_CLASS,__CLASS__); } 
}
/*
PDO::PARAM_BOOL
PDO::PARAM_NULL
PDO::PARAM_INT
PDO::PARAM_STR
PDO::PARAM_LOB
*/
/*
public function __call($method, $args)
    {
        if (!method_exists($this->_obj, $method)) {
            throw new Exception("unknown method [$method]");
        }

        return call_user_func_array(
            array($this->_obj, $method),
            $args
        );
    }

    
    public static function __callStatic($name, $arguments)
    {
         
        echo "Llamando al método estático '$name' "
             . implode(', ', $arguments). "\n";
    }
public function __invoke($x)
    {
        var_dump($x);
    }
*/
?>

