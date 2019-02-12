<!--fin cabeza-return false-->
<body oncontextmenu="">
  <div class="todo">
    <header>
      <a href="inicio"><div class="imglogo"></div></a>
<nav>
  <!-- <a href="/inicio"><div class="col">Inicio</div></a> -->
   <a href="/"><div class="col"  id="activo">Noticias</div></a>
  <a href="/acerca"><div class="col">Qu&iacute;enes Somos</div></a>
  <a href="/servicios"><div class="col">Servicios</div></a>
 
  <a href="/contacto"><div class="col">Contacto</div></a>
  <div class="buscar">

<form name="buscador" action="noticias"><input type="text" name="b" placeholder="Buscar:"/><button type="submit" class="buscardor"title="buscar"/></button></form>
</div>

</nav>
    </header>

<div class="cuerpo">
<div class="limite" id='limite'>
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
<!---->
</div>
<div class="servicios">
<div class='noticias'>


<div id="noticia">
<!------>
<span id='a1'>
<div class="articulo">
<img src="" class="imart aim"/>

<div class="descrip">
  <h3 title=""class='atitle'><titulo></titulo></h3>
  <div class="date">
<p><small><i class="fa fa-calendar"></i>&nbsp;Publicado <publicado></publicado></small></p>
<p><small><i class="fa fa-user"></i>&nbsp;<user></user></small></p>
<p><small><i class="fa fa-eye"></i>&nbsp;<visitas></visitas>&nbsp; Visitas</small></p>
<p><small><i class="fa fa-comments"></i>&nbsp;<comentarios></comentarios> Comentarios</small></p>
<p><small><i class="fa fa-tags"></i>&nbsp;<categoria></categoria></small></p></div>
<div class='contenido'><contenido></contenido></div>
<div class="leer">
<a href="" title="leer mas" class='ai'>Leer Mas</a>
</div>
</div>
</div></span>
<!------>

<div id='a2'class="articulo">
<img src="" class="imart" id='im'/>

<div class="descrip">
  <h3 id='title'></h3>
  <div class="date">
<p><small><i class="fa fa-calendar"></i>&nbsp;Publicado <span id='publicado'></span></small></p>
<p><small><i class="fa fa-user"></i>&nbsp;<span id='user'></span></small></p>
<p><small><i class="fa fa-eye"></i>&nbsp;<span id='visitas'></span>&nbsp; Visitas</small></p>
<p><small><i class="fa fa-comments"></i>&nbsp;<span id='comentarios'></span> Comentarios</small></p>
<p><small><i class="fa fa-tags"></i>&nbsp;<span id='categoria'></span></small></p></div>
<span id='contenido'></span>
<div class="leer">
<a href="/" title="Atras">Atras</a>
</div>
</div>
</div>
<!------>

<div class="comentarios" id='com'>
<h3>Comentarios</h3>  

<span id='comxid'>
<div class="comentarioscont" id='comid'>
<img src="" class="fotocom fcxi"/>
<h6>Escrito por:&nbsp; <acxi></acxi></h6>
<p><small><i class="fa fa-calendar"></i>&nbsp; <pcxi></pcxi>&nbsp;<i class="fa fa-tag"></i>&nbsp;<tcxi></tcxi></small></p>
<p><ccxi></ccxi></p>
</div>
</span>
<div class="formcom">
<form method="post" action="noticias/com">
<h3>Comentar</h3>
<input type="hidden" name="id" value=""/>
<input type="text" name="autor" placeholder="Nombre:"value=''/>
<input type="text" name="correo" placeholder="Correo:"value=''/>
<input type="hidden" name="foto" value=""/>
<input type="hidden" name="categoria" value=""/>
<textarea placeholder="Deja tu Comentario:" name="comentario"></textarea> 
<p><input type="submit" value="Enviar"/></p>
</form>
</div>
</div>

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
<h3>Categorias</h3>
<div class="cat">
<span id='catet'>
<a href="" class='idcat'><p><i class="fa fa-tags"></i> <cate></cate> </p></a>
</span>

<a href="/"><p><i class="fa fa-tags"></i> todas </p></a>
</div>
<h3>Ultimos Comentarios</h3>
<div class="combello" id='com5'>
<!--com-->
<a href="" class='cref'><div class="comecont">
<img src="" class="fotocom"/>
<h6>Escrito por:&nbsp;<i class="fa fa-user"></i> &nbsp; <autor5></autor5></h6>
<p><small><i class="fa fa-calendar"></i>&nbsp;<public5></public5>&nbsp;<i class="fa fa-tags"></i>&nbsp;<catcom5></catcom5></small></p>
<p><comen5></comen5></p>
</div></a>
<!--com-->
</div>
<h3>Chat</h3>
<!--chatbox-->
<div class="shout_caja">
  <div class="toggle_chat">
  <div class="message_box">
    </div>
    <div class="user_info">
     
      <input type='hidden' id='shout_username' name='shout_username' value=''/>
    
   <input name="shout_message" id="shout_message" type="text" placeholder="Escribe un mensaje y Pulsa Enter" maxlength="100" />
    
    </div>
    </div>
</div>
<!--chatbox-->
</aside>

</div></div>

</div>
