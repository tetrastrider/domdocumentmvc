<body><div class="todo">
     <header>
    <a href="inicio" title="inicio"><div class="imglogo" title="overclocktech"></div></a>
<nav>
  <a href="inicio" title="inicio"><div class="col"id="activo">Inicio</div></a>
  <a href="noticias" title="noticias"><div class="col">Noticias</div></a>
  <a href="acerca" title="acerca"><div class="col">Qu&iacute;enes Somos</div></a>
  <a href="servicios" title="servicios"><div class="col">Servicios</div></a>
  
  <a href="contacto" title="contacto"><div class="col">Contacto</div></a>

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
<div class='ultimas'>
  <!-------------------------------->
<div id="content-slider">
      <div id="slider">
          <div id="mask">
            <ul>{{each: slider }}
            <li id="[id]" class="[class]">
            <a href="#">
            <img src="[baner]" alt="[titulo]"/>
            </a>
            <div class="tooltip">
            <h1>[titulo]</h1>
            </div>
            </li>{{/each}}
            </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
 <!-------------------------------->
           
<div id="content-slider">
      <div id="slider">
          <div id="mask">
            <ul>{{each: s2 }}
            <li id="[id2]" class="[class2]">
            <a href="#">
            <img src="[baner2]" alt="[titulo2]"/>
            </a>
            <div class="tooltip">
            <h1>[titulo2]</h1>
            </div>
            </li>{{/each}}
            </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
 <!-------------------------------->
<div id="content-slider">
      <div id="slider">
          <div id="mask">
            <ul>{{each: s3 }}
            <li id="[id3]" class="[class3]">
            <a href="#">
            <img src="imagenes/[baner3]" alt="[titulo3]"/>
            </a>
            <div class="tooltip">
            <h1>[titulo3]</h1>
            </div>
            </li>{{/each}}
            </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
<!-------------------------------->
<div id="content-slider">
      <div id="slider">
          <div id="mask">
            <ul>{{each: s4 }}
            <li id="[id4]" class="[class4]">
            <a href="#">
            <img src="imagenes/[baner4]" alt="[titulo4]"/>
            </a>
            <div class="tooltip">
            <h1>[titulo4]</h1>
            </div>
            </li>{{/each}}
            </ul>
            </div>
            <div class="progress-bar"></div>
        </div>
    </div>
<!-------------------------------->
</div>
<!--noticia-->
</div>
<div class="categoria">

<!--chatbox-->
</div>
</div>
</div>

