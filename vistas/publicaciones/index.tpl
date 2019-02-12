<body><div class="todo">
    <header>
    <nav>
  <a href="inicio"><div class="col">Sitio Web</div></a>
  <a href="/Administrador"><div class="col">Publicar</div></a>
  <a href="/publicaciones"><div class="col"  id="activo">Publicaciones</div></a>
  <a href="/registro"><div class="col">Control</div></a>
  <a href="/administrador/salir"><div class="col">Salir</div></a>
  <div class="buscar">
<form name="buscador" action="Publicaciones"><input type="text" name="b" placeholder="Buscar:"/><button type="submit" class="buscardor"title="buscar"/></button></form>
</div>
</nav>
    </header>

<div class="cuerpo">
<div class="limite">
<!---->
<form  name="orden" method="get">
<input type="hidden" name="pG" value=""/>
<label class="m custom-select">

<select name="lt" onchange='this.form.submit()'>
<option value=5>5</option>
<option value=10>10</option>
<option value=15>15</option>
<option value=20>20</option>
<option value=25>25</option>
<option value=30>30</option>
</select>
</label>

<label class="n custom-select">
<select name="co" onchange='this.form.submit()'>
<option value=2>Publicaciones Nuevas</option>
<option value=1>Publicaciones Anteriores</option>
</select>

</label>
<noscript><input type="submit" value="Submit"></noscript>
 </form>
</div>
<div class="servicios">
<div class='noticias'>
<div id="noticia">
 <!------>
<span id='a1'>
<div class="envase oculto">
<img src="" class="imart aim"/>
<div class="descrip">
  <h6 title=""class='atitle'><titulo></titulo></h6>
  <div class="date oculto">
<p><small><i class="fa fa-calendar"></i>&nbsp;<publicado></publicado></small></p>
<p><small><i class="fa fa-user"></i>&nbsp;<user></user></small></p>
<p><small><i class="fa fa-eye"></i>&nbsp;<visitas></visitas>&nbsp; Visitas</small></p>
<p><small><i class="fa fa-comments"></i>&nbsp;<comentarios></comentarios> Comentarios</small></p>
<p><small><i class="fa fa-tags"></i>&nbsp;<categoria></categoria></small></p></div>
<div class="leer">
<a href=""  title="Editar" class='ai boton'>Editar</a>
<a href="" title="Borrar"class='boton br'>Borrar</a>
</div>
</div>
</div></span>
<!------>
<!-------->
<div id="paginador">
<ul class="pagina">
  
<li id='1'><a id='1' href=""><i class="fa fa-step-backward"></i></a></li>
<li id='2'><a id='2' href=""><i class="fa fa-angle-double-left"></i></a></li>
<li id='pgt'></li>
<li id='3'><a id='3' href=""><i class="fa fa-angle-double-right"></i></a></li>
<li id='4' ><a id='4' href=""><i class="fa fa-step-forward"></i></a></li>

  </ul>
  </div>

<!--paginacion-->
</div>
<aside>
  <!---adminbaner---->
  <div class='envase admin'>
   <center><h3><usuario></usuario></h3></center>
  </div>
  <!---adminbaner---->
  <!--cat-->
  <h6>Categorias</h6>
<div class="cat">
<span id='catet'>
<a href="" class='idcat'><p><i class="fa fa-tags"></i> <cate></cate> </p></a>
</span>
<a href="/publicaciones"><p><i class="fa fa-tags"></i> todas </p></a>
</div>
  <!--cat-->
 <hr>
<!--chatbox-->
</aside>
</div>
</div>