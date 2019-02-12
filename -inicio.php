<?php

class tpl{
	private $tpl;
	private $arreglo = array();
	private $nivel = 0;


	public function __construct($file){
		$this->tpl = $file;

	}

	public function set($key, $value) {


            $this->arreglo[$key] = $value;
        }

    public function mset($arreglo){

            foreach ($arreglo as $arg) {

        
                foreach ($arg as $key => $value) {
                     $this->valor[$key] = $value;
                }
      

            }

        }

    public function dump(){

    	var_dump($this->arreglo);
    }

	public function render(){

        if(preg_match('~\{(\w+)\}~',$this->tpl, $match)){
            
            foreach ($this->arreglo as $key => $value){ 
           
               $this->tpl = str_replace('{'.$match[1].'}',$value, $this->tpl);
               
            }
            
        }

        /************************************/

        if(preg_match('~\{loop\s\$(\w+)}\s+([^\{]*)\s+\{\/loop\}~',$this->tpl,$match)){

           var_dump($match);

        }

	/***********************************/
	 //echo $this->tpl;

	}
	
}


$tpl = new tpl('<p>hhhhh</p>{ok}{loop $ok} $content $data {/loop}');
$tpl->set('ok', 10);
//$tpl->dump();
// echo 
$tpl->render();