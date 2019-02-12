<body><div class="todo">
    <header>
<nav>
  <a href="inicio"><div class="col">Sitio Web</div></a>
  <a href="/Administrador"><div class="col">Publicar</div></a>
  <a href="/publicaciones"><div class="col">Publicaciones</div></a>
  <a href="/registro"><div class="col"  id="activo">control</div></a>
  <a href="/administrador/salir"><div class="col">Salir</div></a>
  <div class="buscar">

<form name="buscador" action="noticias"><input type="text" name="b" placeholder="Buscar:"/><button type="submit" class="buscardor"title="buscar"/></button></form>
</div>
</nav>
    </header>

<div class="cuerpo">
<div class="limite">

</div>
<div class="servicios">
<div class='noticias'>
<div id="noticia">
<!--noticia-->
<div class="label"><h4>Usuarios <i class="fa fa-users"></i></h4><a class="hidden"><i class="fa fa-chevron-down"></i></a><a href="" class="serrar"><i class="fa fa-times"></i></a></div>
<div class="contenedor" id='usuarios'>

<div class="envase floatl"><p><small><i class="fa fa-calendar"></i>&nbsp;<reg></reg></small></p><p><small><i class="fa fa-user"></i>&nbsp;<usus></usus></small></p><p><small><i class="fa fa-envelope-o"></i>&nbsp;<ml></ml></small></p><p><small><i class="fa fa-users"></i>&nbsp;<rl></rl></small></p><p><small><i class="fa fa-power-off"></i>&nbsp;<st></st></small></p><a title="Estado" class="boton stb">Estado</a>
  <a title="Borrar"class="boton del">Borrar</a>
</div>

</div>
<!------>
<div class="label"><h4>Base de datos <i class="fa fa-database"></i></h4><a class="hidden"><i class="fa fa-chevron-down"></i></a><a href="" class="serrar"><i class="fa fa-times"></i></a></div>
<div class="contenedor">
<!-------->

<div class="envase floatl">
<div class="allcat" id='basedatos'>
<span><h6 class="dtb"><tbl></tbl></h6><a class="dbl"><i class='fa fa-trash'></i></a></span>
</div>
</div>

<!-------->
</div>
<!------>
<div class="label"><h4>sql comandos <i class="fa fa-wrench"></i></h4><a class="hidden"><i class="fa fa-chevron-down"></i></a><a href="" class="serrar"><i class="fa fa-times"></i></a></div>
<div class="contenedor">
<!---->
<form name="comando" action="/" method="get">
<select name="bd" id='db'>
<option class="data"><data></data></option>
</select>
<textarea name="sql" placeholder='entrar comando sql'></textarea>
<button type="submit" class="boton">ejecutar</button>
</form>
<!---->
</div>
<!---->
<div class="label"><h4>Categorias <i class="fa fa-tags"></i></h4><a class="hidden"><i class="fa fa-chevron-down"></i></a><a href="" class="serrar"><i class="fa fa-times"></i></a></div>
<div class="contenedor">
<!-------->

<div class="envase floatl">
<div class="allcat" id='vercat'>

<span>
  <h6 class='tt'><tt></tt></h6>
  <a class='tl'><i class="fa fa-trash"></i></a>
</span>

</div>
</div>

<!-------->
</div>
<!---->
<div class="label"><h4>Paginas <i class="fa fa-flag"></i></h4><a class="hidden"><i class="fa fa-chevron-down"></i></a><a href="" class="serrar"><i class="fa fa-times"></i></a></div>
<div class="contenedor">
<!-------->

<div class="envase floatl">
<div class="allcat" id='ctn'>

<span><h6 class='value'><vue></vue></h6><a class='tr'><i class='fa fa-trash'></i></a></span>

</div>
</div>

<!-------->
</div>
<!--noticia-->
</div>
<aside>
  <!---adminbaner---->
  <div class='envase admin'>
   <center><h3><user></user></h3></center>
  </div>
  <!---adminbaner---->
  <!----hdd---->
  <div class="envase mod">
   <center><p><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp; Espacio libre  <espaciol></espaciol></p></center>
  </div>
<!-------->
<!----hdd---->
  <div class="envase mod">
   <center><p><i class="fa fa-hdd-o" aria-hidden="true"></i>&nbsp; Espacio total  <espaciot></espaciot></p></center>
  </div>
<!-------->
 <!----fecha---->
  <div class="envase mod">
   <center><p><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp; Fecha <fecha></fecha></p></center>
  </div>
<!-------->
<!----fecha---->
  <div class="envase mod">
   <center><p><i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp; Arriba <serverup></serverup></p></center>
  </div>
<!-------->
<!----fecha---->
  <div class="envase mod">
   <center><p><i class="fa fa-tachometer" aria-hidden="true"></i>&nbsp; Carga del servidor <load></load></p></center>
  </div>
<!-------->
</aside>
</div>
</div>







