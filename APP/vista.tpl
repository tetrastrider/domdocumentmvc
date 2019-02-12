<?php
class vistas{

private $locked = PRIVADO;//control acceso
private $metodo;
private $vista;
private $salida;
private $dom;
private $ruta;
private $valor = array();
public function __construct(Request $peticion) {
    		$this->vista = $peticion->vista();
    		$this->metodo = $peticion->metodo();
        $this->dom = new DOMDocument;
        $this->compilar();
  }

public function script($tag,$lev,$cont){

  $script=$this->dom->createElement("script");
  $script->setAttribute('type', 'text/javascript');
  $script->setAttribute('language','javascript');
  $script->setAttribute('rel','javascript');
  $script->setAttribute('src',$cont);
  $this->dom->getElementsByTagName($tag)->item($lev)->appendChild($script);
}

public function css($tags,$level,$contenido){

  $css=$this->dom->createElement('link');
  $css->setAttribute("type","text/css");
  $css->setAttribute('rel','stylesheet');
  $css->setAttribute('href',$contenido);
  $this->dom->getElementsByTagName($tags)->item($level)->appendChild($css);

}
public function contenido($element) 
{ 
    $innerHTML = ""; 
    $children = $element->childNodes; 
    foreach ($children as $child) 
    { 
        $tmp_dom = new DOMDocument(); 
        $tmp_dom->appendChild($tmp_dom->importNode($child, true)); 
        $innerHTML.=trim($tmp_dom->saveHTML()); 
    } 
    return $innerHTML; 
} 
public function set($q,$k,$v,$n=0){
  $q='//'.$q;
  $nodes = $this->ruta->query($q);$node = $nodes->item($n);
        $node->setAttribute ($k,$v);
}
public function cont($q,$contenido){
  $content = $this->dom->getElementById($q);
  $god = $this->dom->createTextNode($this->filtro($contenido));
  $content->appendChild($god);
}

public function inner($q,$contenido){
  $content = $this->dom->getElementById($q);
  $fragment=$this->dom->createDocumentFragment();
  $fragment->appendXML($this->filtro($contenido));
  $content->appendChild($fragment);

}
private function tags($tags,$level,$contenido){
  $goddom = $this->dom->createTextNode($this->filtro($contenido));
$this->dom->getElementsByTagName($tags)->item($level)->appendChild($goddom);
}

public function eti($q,$contenido,$n=0){
  $content = $this->dom->getElementsByTagName($q)->item($n);
  $fragment=$this->dom->createDocumentFragment();
  $fragment->appendXML($this->filtro($contenido));
  $content->appendChild($fragment);

}
public function get($q,$v,$n=0){
  $q='//'.$q;
  $nodes = $this->ruta->query($q);$node = $nodes->item($n);
      return $node->getAttribute($v);
}
public function remove($r){
  $nodes = $this->dom->getElementById($r);

$length=count($nodes->hasChildNodes());

for ($i=$length-1;$i>=0;$i--)
{
    $nodes->removeChild($nodes->firstChild);        
   $nodes->parentNode->removeChild($nodes);
}
}
/********************************************************************/                  
private function compilar(){



    if(in_array($this->vista,$this->locked)){

  if(!isset($_SESSION['user'])){ header("location:/"); }

  $this->salida = file_get_contents("maqueta/head".EXT);

  }elseif(!in_array($this->vista,$this->locked)){
            
 $this->salida = file_get_contents("maqueta/cabeza".EXT);
            
  }elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){}

/******/

  if(file_exists('vistas/'.$this->vista.'/'.$this->metodo.''.EXT)){

   if(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
      $this->salida .= file_get_contents('vistas/'.$this->vista.'/'.$this->metodo.''.EXT);
    }else{
      $this->salida = file_get_contents('vistas/'.$this->vista.'/'.$this->metodo.''.EXT);
    }

    }else{

   if(file_exists('vistas/'.$this->vista.'/index'.EXT)){
    if(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
      $this->salida .= file_get_contents('vistas/'.$this->vista.'/index'.EXT);
    }else{
      $this->salida = file_get_contents('vistas/'.$this->vista.'/index'.EXT);
    }

   }else{
    if(PAGINA_ERROR==true){

    $this->salida .= file_get_contents('vistas/error/index'.EXT);

  }else{
    header("location:/");
  }
  
  
 }
}

/***pie***/

if(in_array($this->vista,$this->locked)){
  $this->salida .=file_get_contents('maqueta/foot'.EXT);

}elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){ 
  $this->salida .=file_get_contents('maqueta/pie'.EXT);
}

$this->dom->preserveWhiteSpace = false;
  libxml_use_internal_errors(true);
  $this->dom->loadHTML($this->xml(trim(mb_convert_encoding($this->salida, 'HTML-ENTITIES', 'UTF-8'))));
  libxml_clear_errors();
  libxml_use_internal_errors(false);
  $this->ruta = new DOMXPath($this->dom);
$this->tags('title',0,$this->vista);
$this->script('head',0,'dom/'.$this->vista.'/index.js');
if(in_array($this->vista,$this->locked)){
$this->css('head',0,'/css/'.TEMA.'/admin.css');
}else{
$this->css('head',0,'/css/'.TEMA.'/estilos.css');
}
$this->css('head',0,'/css/'.TEMA.'/'.$this->vista.'/index.css');
$this->css('head',0,'/css/font-awesome/css/font-awesome.css');
$this->css('head',0,'css/style.css');
$this->script('head',0,'/js/jq.js');
}
/*****render*****/
public function ver(){
$this->dom->formatOutput = true;
echo $this->dom->saveHTML();
}
private function removerhijos(&$nd){ @$nd->parentNode->replaceChild($n = $nd->cloneNode(false),$nd); $nd = $n; }

public function each($q,$data,$dios,$n=0){
  $tmp = null;
  $clonar = null; 
  $content = $this->dom->getElementById($q);

    $clonar = ""; 
    $children = $content->childNodes;

    foreach ($children as $child) 
    { 
        $tmp = new DOMDocument(); 
        $tmp->appendChild($tmp->importNode($child, true)); 
        $clonar.=trim($this->xml($tmp->saveHTML())); 
    } 
    
$this->removerhijos($content);

foreach($data as $valkkk){
$fragment = $this->dom->createDocumentFragment();
$fragment->appendXML($this->xml($clonar));
$content->appendChild($fragment);
}
/*************************************************/
for ($i=0; $i < count($data); $i++) { 
/***********************************************/
 foreach($dios as $keya=>$valu){ 
    if(!isset($valu[2])){
  switch ($valu[0]) {
    case 'co':
      $content = $this->dom->getElementsByTagName($keya)->item($i);
    $fragment=$this->dom->createDocumentFragment();
    $fragment->appendXML($this->xml(filter_var($data[$i][$valu[1]],FILTER_SANITIZE_STRING)));
    $content->appendChild($fragment);
      break;

    default:
      $nodes = $this->ruta->query('//'.$keya);$node = $nodes->item($i);
      $node->setAttribute($valu[0],strip_tags($this->xml(strtolower($data[$i][$valu[1]]))));
      break;
    }
      }else{
      $nodes = $this->ruta->query('//'.$keya);$node = $nodes->item($i);
      $node->setAttribute($valu[0],strip_tags($this->xml(strtolower($valu[2].$data[$i][$valu[1]]))));
      }
}
  //hasta aqui      
}

/*************************************************/
}

private function filtro($html){
  $entities = array ( '&nbsp;' => ' ', '&iexcl;' => '¡', '&cent;' => '¢', '&pound;' => '£', '&curren;' => '¤', '&yen;' => '¥', '&brvbar;' => '¦', '&sect;' => '§', '&uml;' => '¨', '&copy;' => '©', '&ordf;' => 'ª', '&laquo;' => '«', '&not;' => '¬', '&shy;' => '­', '&reg;' => '®', '&macr;' => '¯', '&deg;' => '°', '&plusmn;' => '±', '&sup2;' => '²', '&sup3;' => '³', '&acute;' => '´', '&micro;' => 'µ', '&para;' => '¶', '&middot;' => '·', '&cedil;' => '¸', '&sup1;' => '¹', '&ordm;' => 'º', '&raquo;' => '»', '&frac14;' => '¼', '&frac12;' => '½', '&frac34;' => '¾', '&iquest;' => '¿', '&Agrave;' => 'À', '&Aacute;' => 'Á', '&Acirc;' => 'Â', '&Atilde;' => 'Ã', '&Auml;' => 'Ä', '&Aring;' => 'Å', '&AElig;' => 'Æ', '&Ccedil;' => 'Ç', '&Egrave;' => 'È', '&Eacute;' => 'É', '&Ecirc;' => 'Ê', '&Euml;' => 'Ë', '&Igrave;' => 'Ì', '&Iacute;' => 'Í', '&Icirc;' => 'Î', '&Iuml;' => 'Ï', '&ETH;' => 'Ð', '&Ntilde;' => 'Ñ', '&Ograve;' => 'Ò', '&Oacute;' => 'Ó', '&Ocirc;' => 'Ô', '&Otilde;' => 'Õ', '&Ouml;' => 'Ö', '&times;' => '×', '&Oslash;' => 'Ø', '&Ugrave;' => 'Ù', '&Uacute;' => 'Ú', '&Ucirc;' => 'Û', '&Uuml;' => 'Ü', '&Yacute;' => 'Ý', '&THORN;' => 'Þ', '&szlig;' => 'ß', '&agrave;' => 'à', '&aacute;' => 'á', '&acirc;' => 'â', '&atilde;' => 'ã', '&auml;' => 'ä', '&aring;' => 'å', '&aelig;' => 'æ', '&ccedil;' => 'ç', '&egrave;' => 'è', '&eacute;' => 'é', '&ecirc;' => 'ê', '&euml;' => 'ë', '&igrave;' => 'ì', '&iacute;' => 'í', '&icirc;' => 'î', '&iuml;' => 'ï', '&eth;' => 'ð', '&ntilde;' => 'ñ', '&ograve;' => 'ò', '&oacute;' => 'ó', '&ocirc;' => 'ô', '&otilde;' => 'õ', '&ouml;' => 'ö', '&divide;' => '÷', '&oslash;' => 'ø', '&ugrave;' => 'ù', '&uacute;' => 'ú', '&ucirc;' => 'û', '&uuml;' => 'ü', '&yacute;' => 'ý', '&thorn;' => 'þ', '&yuml;' => 'ÿ', '&OElig;' => 'Œ', '&oelig;' => 'œ', '&Scaron;' => 'Š', '&scaron;' => 'š', '&Yuml;' => 'Ÿ', '&fnof;' => 'ƒ', '&circ;' => 'ˆ', '&tilde;' => '˜', '&Alpha;' => 'Α', '&Beta;' => 'Β', '&Gamma;' => 'Γ', '&Delta;' => 'Δ', '&Epsilon;' => 'Ε', '&Zeta;' => 'Ζ', '&Eta;' => 'Η', '&Theta;' => 'Θ', '&Iota;' => 'Ι', '&Kappa;' => 'Κ', '&Lambda;' => 'Λ', '&Mu;' => 'Μ', '&Nu;' => 'Ν', '&Xi;' => 'Ξ', '&Omicron;' => 'Ο', '&Pi;' => 'Π', '&Rho;' => 'Ρ', '&Sigma;' => 'Σ', '&Tau;' => 'Τ', '&Upsilon;' => 'Υ', '&Phi;' => 'Φ', '&Chi;' => 'Χ', '&Psi;' => 'Ψ', '&Omega;' => 'Ω', '&alpha;' => 'α', '&beta;' => 'β', '&gamma;' => 'γ', '&delta;' => 'δ', '&epsilon;' => 'ε', '&zeta;' => 'ζ', '&eta;' => 'η', '&theta;' => 'θ', '&iota;' => 'ι', '&kappa;' => 'κ', '&lambda;' => 'λ', '&mu;' => 'μ', '&nu;' => 'ν', '&xi;' => 'ξ', '&omicron;' => 'ο', '&pi;' => 'π', '&rho;' => 'ρ', '&sigmaf;' => 'ς', '&sigma;' => 'σ', '&tau;' => 'τ', '&upsilon;' => 'υ', '&phi;' => 'φ', '&chi;' => 'χ', '&psi;' => 'ψ', '&omega;' => 'ω', '&thetasym;' => 'ϑ', '&upsih;' => 'ϒ', '&piv;' => 'ϖ', '&ensp;' => ' ', '&emsp;' => ' ', '&thinsp;' => ' ', '&zwnj;' => '‌', '&zwj;' => '‍', '&lrm;' => '‎', '&rlm;' => '‏', '&ndash;' => '–', '&mdash;' => '—', '&lsquo;' => '‘', '&rsquo;' => '’', '&sbquo;' => '‚', '&ldquo;' => '“', '&rdquo;' => '”', '&bdquo;' => '„', '&dagger;' => '†', '&Dagger;' => '‡', '&bull;' => '•', '&hellip;' => '…', '&permil;' => '‰', '&prime;' => '′', '&Prime;' => '″', '&lsaquo;' => '‹', '&rsaquo;' => '›', '&oline;' => '‾', '&frasl;' => '⁄', '&euro;' => '€', '&image;' => 'ℑ', '&weierp;' => '℘', '&real;' => 'ℜ', '&trade;' => '™', '&alefsym;' => 'ℵ', '&larr;' => '←', '&uarr;' => '↑', '&rarr;' => '→', '&darr;' => '↓', '&harr;' => '↔', '&crarr;' => '↵', '&lArr;' => '⇐', '&uArr;' => '⇑', '&rArr;' => '⇒', '&dArr;' => '⇓', '&hArr;' => '⇔', '&forall;' => '∀', '&part;' => '∂', '&exist;' => '∃', '&empty;' => '∅', '&nabla;' => '∇', '&isin;' => '∈', '&notin;' => '∉', '&ni;' => '∋', '&prod;' => '∏', '&sum;' => '∑', '&minus;' => '−', '&lowast;' => '∗', '&radic;' => '√', '&prop;' => '∝', '&infin;' => '∞', '&ang;' => '∠', '&and;' => '∧', '&or;' => '∨', '&cap;' => '∩', '&cup;' => '∪', '&int;' => '∫', '&there4;' => '∴', '&sim;' => '∼', '&cong;' => '≅', '&asymp;' => '≈', '&ne;' => '≠', '&equiv;' => '≡', '&le;' => '≤', '&ge;' => '≥', '&sub;' => '⊂', '&sup;' => '⊃', '&nsub;' => '⊄', '&sube;' => '⊆', '&supe;' => '⊇', '&oplus;' => '⊕', '&otimes;' => '⊗', '&perp;' => '⊥', '&sdot;' => '⋅', '&lceil;' => '⌈', '&rceil;' => '⌉', '&lfloor;' => '⌊', '&rfloor;' => '⌋', '&lang;' => '〈', '&rang;' => '〉', '&loz;' => '◊', '&spades;' => '♠', '&clubs;' => '♣', '&hearts;' => '♥', '&diams;' => '♦','&Hat;'=>'^','&lbrace;'=>'{','&lcub;'=>'{','&rbrace;'=>'}','&rcub;'=>'}','&QUOT;'=>'"','&quot;'=>'"','&semi;'=>';','&lpar;'=>'(','&rpar;'=>')','&rsqb;'=>']','&rbrack;'=>']','&lsqb;'=>'[','&lbrack;'=>'[','&midast;'=>'*','&midast;'=>'*','&dollar;'=>'$' );  //,,'&amp;'=>'&','&AMP;'=>'&'
  return str_replace (array_keys ($entities), array_values ($entities), $html);
}
private function fixtags($source){
  $source = preg_replace ('/<([^<]*[^ ])\/>/', '<$1 />', $source);
    
    $source = preg_replace ('/<(div|iframe|[ou]l|script|textarea|title)([^>]*) ?\/>/i', '<$1$2></$1>', $source);
   
    while (preg_match ('/(<(?!!)[^>]+\s)([a-z-]+)=([\'"]?)\2\3/im', $source, $m, PREG_OFFSET_CAPTURE))
      $source = substr_replace ($source, $m[1][0].$m[2][0], $m[0][1], strlen ($m[0][0]));
   
    $source = preg_replace ('/<!\[CDATA\[(.*?)\]\]>/s', '$1', $source);
    
    return $source;
}

private function xml ($text) {
   $text = $this->fixtags($text);
    $text = $this->filtro($text);

    $text = preg_replace (
      '/<(base|basefont|br|col|img|input|link|meta|param|source|track)([^>]*)(?<!\/)>(?!<\/$1>)/is',
      '<$1$2 />', $text
    );

    while (preg_match (
      '/(?>(<(?!!)[a-z-]+(?:\s|[a-z-]+="[^"]*")+))([a-z-]+)(?=[>\s])/is', $text, $m, PREG_OFFSET_CAPTURE
    )) $text = substr_replace (
      $text, $m[1][0].$m[2][0].'="'.$m[2][0].'"', $m[0][1], strlen ($m[0][0])
    );
    
    return $text;
  }

}?>
