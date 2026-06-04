<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.seguridad.Usuario" %>
<%
    HttpSession sesionNavbar = request.getSession(false);
    com.productos.seguridad.Usuario usuarioActivo = null;
    
    if (sesionNavbar != null && sesionNavbar.getAttribute("usuarioLogueado") != null) {
        usuarioActivo = (com.productos.seguridad.Usuario) sesionNavbar.getAttribute("usuarioLogueado");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoStrid</title>
<link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js"></script>
<script src="https://aframe.io/releases/1.4.0/aframe.min.js"></script>
</head>
<body class="site-wrapper">

	<main class="main-container">
		<header class="main-header">
			<h1 class="main-logo">NeoStrid</h1>
			<div class="search_bar">
				<input type="text" class="search" placeholder="Jordan, Nike ....">

				<% if (usuarioActivo == null) { %>
					<a href="login.jsp"> <i class="bi bi-person-circle"></i></a>
				<% } else { %>
					<span style="color: #fff; font-size: 0.9rem; margin-right: 10px; font-family: inherit;">
						Hola, <strong><%= usuarioActivo.getNombre() %></strong>
					</span>
					<a href="logout.jsp" style="color: #ff0000; text-decoration: none; font-size: 0.85rem;"><i class="bi bi-box-arrow-right"></i></a>
				<% } %>
			</div>
		</header>

		<nav class="nav-bar">
			<ul class="nav-list">
				<li class="nav-item"><a href="inicio.jsp" class="nav-link">Inicio</a></li>
				<li class="nav-item"><a href="hombres.jsp" class="nav-link">Hombres</a></li>
				<li class="nav-item"><a href="mujeres.jsp" class="nav-link">Mujeres</a></li>
				<li class="nav-item"><a href="niños.jsp" class="nav-link">Niños</a></li>
				<li class="nav-item"><a href="niñas.jsp" class="nav-link">Niñas</a></li>
			</ul>
		</nav>

		<article class="carousel">
			<button onclick="prev()">❮</button>
			<img id="img" src="img/img1.jpg">
			<button onclick="next()">❯</button>
		</article>
		
		<div class="content-layout">
			<section class="main-content">
				<article class="brands-section">
					<h3 class="section-title">Nuestras Marcas</h3>
					<section class="container_marcas">
						<img src="img/adidas.png" alt="nike"> 
						<img src="img/jordan.png" alt="jordan"> 
						<img src="img/nike.png" alt="adidas">
					</section>
				</article>

				<article class="promo-section">
					<h3 class="section-title">Productos destacados</h3>
					<section class="productos">
						<div class="grid-productos">
			  				<article class="card-producto">
								<model-viewer src="3d/newbalance.glb" auto-rotate camera-controls disable-pan disable-zoom interaction-prompt="none" shadow-intensity="1">
								</model-viewer>
								<h4>New balance 574 Classic</h4>
								<p class="precio">$150</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/adidas_shoes.glb" ar camera-controls shadow-intensity="1" auto-rotate rotation-per-second="30deg" interaction-prompt="none" loading="lazy"> </model-viewer>
								<h4>Adidas Grand Court 2.0</h4>
								<p class="precio">$100</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/vans.glb" ar camera-controls shadow-intensity="1" auto-rotate rotation-per-second="30deg" interaction-prompt="none" loading="lazy"> </model-viewer>
								<h4>Vans Old Skool</h4>
								<p class="precio">$80</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/adidas_messi.glb" ar camera-controls shadow-intensity="1" auto-rotate rotation-per-second="30deg" interaction-prompt="none" loading="lazy"> </model-viewer>
								<h4>Adidas Messi 15.2</h4>
								<p class="precio">$200</p>
							</article>
						</div>
					</section>
				</article>

				<article class="vr-section">
    <h3 class="section-title">Showroom Virtual 360°</h3>
    <div class="vr-container">
        
        <iframe src="https://skybox.blockadelabs.com/e/372023d7820309d901c1afeafd28cf61" 
                width="100%" 
                height="100%" 
                style="border:0;" 
                allow="fullscreen">
        </iframe>
    </div>
</article>

			<aside class="sidebar-location">
				<div class="mascot-card">
					<h4>Mascota AR</h4>
					<model-viewer src="3d/mascota.glb" ar ar-modes="webxr scene-viewer quick-look" autoplay camera-controls shadow-intensity="1" interaction-prompt="none"></model-viewer>
					<p>¡Interactúa en 3D!</p>
				</div>

				<h3 class="section-title">Nuestra Ubicación</h3>
				<div class="map-container">
					<iframe src="https://maps.google.com/maps?q=E6ZmPPdRtJBg9SvQA&t=&z=15&ie=UTF8&iwloc=&output=embed" width="100%" height="500" style="border:0; border-radius: 8px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</aside>
		</div>
	</main>

	<footer class="main-footer">
		<p class="footer-copy">© 2026 NeoStrid - Victor Paz.</p>
		<div class="social-container">
			<a href="https://www.tiktok.com/@matipaz3"><img src="img/tik-tok.png" class="social" alt="tiktok"></a>
			<a href="#"><img src="img/facebook.png" class="social"></a> 
			<a href="#"><img src="img/instagram.png" class="social"></a> 
			<a href="https://github.com/VicttorPaz"><img src="img/github.png" class="social"></a> 
			<a href="https://www.linkedin.com/in/victor-paz"><img src="img/linkedin.png" class="social"></a>
		</div>
	</footer>
	
	<script>
		let images = [ "img/car1.jpg", "img/car2.jpg", "img/car3.jpg" ];
		let i = 0;

		function next() {
			i = (i + 1) % images.length;
			document.getElementById("img").src = images[i];
		}

		function prev() {
			i = (i - 1 + images.length) % images.length;
			document.getElementById("img").src = images[i];
		}
	</script>
</body>
</html>