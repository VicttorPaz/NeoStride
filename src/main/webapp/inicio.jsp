<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NeoStrid</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script type="module"
	src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js"></script>
</head>
<body class="site-wrapper">
	<main class="main-container">
		<header class="main-header">
			<h1 class="main-logo">NeoStrid</h1>
			<div class="search_bar">
				<input type="text" class="search" placeholder="Jordan, Nike ....">

				<a href="login.jsp"> <i class="bi bi-person-circle"></i></a>


			</div>
		</header>

		<nav class="nav-bar">
			<ul class="nav-list">
				<li class="nav-item"><a href="inicio.jsp" class="nav-link">Inicio</a></li>
				<li class="nav-item"><a href="catalogo.jsp" class="nav-link">Catálogo</a></li>
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
						<img src="img/adidas.png" alt="nike"> <img
							src="img/jordan.png" alt="jordan"> <img
							src="img/adidas.png" alt="adidas">
					</section>
				</article>

				<article class="promo-section">
					<h3 class="section-title">Productos destacados</h3>


					<section class="productos">


						<div class="grid-productos">

			<!--  				<article class="card-producto">
								<model-viewer src="3d/newbalance.glb" auto-rotate
									camera-controls disable-pan disable-zoom
									interaction-prompt="none" shadow-intensity="1">
								</model-viewer>

								<h4>New balance 574 Classic</h4>
								<p class="precio">$150</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/adidas_shoes.glb" ar camera-controls
									shadow-intensity="1" auto-rotate rotation-per-second="30deg"
									interaction-prompt="none" loading="lazy"> </model-viewer>

								<h4>Adidas Grand Court 2.0</h4>
								<p class="precio">$100</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/vans.glb" ar camera-controls
									shadow-intensity="1" auto-rotate rotation-per-second="30deg"
									interaction-prompt="none" loading="lazy"> </model-viewer>

								<h4>Vans Old Skool</h4>
								<p class="precio">$80</p>
							</article>

							<article class="card-producto">
								<model-viewer src="3d/adidas_messi.glb" ar camera-controls
									shadow-intensity="1" auto-rotate rotation-per-second="30deg"
									interaction-prompt="none" loading="lazy"> </model-viewer>

								<h4>Adidas Messi 15.2</h4>
								<p class="precio">$200</p>
							</article>
-->


						</div>
					</section>


				</article>
			</section>
		</div>
		
		<div class="container my-5">
  <div class="row justify-content-center">
    
    <!-- Tarjeta de Producto -->
    <div class="col-md-4">
      <div class="card h-100 shadow-sm text-center">
        
        <!-- Contenedor del Visor 3D (Reemplaza a la imagen tradicional) -->
        <div class="bg-light p-3" style="height: 350px; position: relative;">
          <model-viewer 
            src="modelos/zapato.glb" 
            ios-src="modelos/zapato.usdz"
            alt="Zapato Deportivo 3D" 
            ar 
            ar-modes="webxr scene-viewer quick-look" 
            camera-controls 
            touch-action="pan-y"
            style="width: 100%; height: 100%; --poster-color: transparent;">
            
            <!-- Botón flotante estilo Bootstrap para activar VR/AR -->
            <button slot="ar-button" class="btn btn-sm btn-dark position-absolute bottom-0 start-50 translate-middle-x mb-3 shadow">
              <i class="bi bi-box"></i> Ver en tu espacio (AR/VR)
            </button>
            
          </model-viewer>
        </div>

        <!-- Información del Zapato -->
        <div class="card-body d-flex flex-column">
          <h5 class="card-title fw-bold">Modelo NeoStrid X</h5>
          <p class="card-text text-muted small">Zapato deportivo con tecnología de amortiguación avanzada y materiales sostenibles.</p>
          <div class="mt-auto">
            <span class="fs-4 fw-bold text-dark d-block mb-3">$89.99</span>
            <button class="btn btn-primary w-100 fw-bold">Añadir al carrito</button>
          </div>
        </div>

      </div>
    </div>
    
  </div>
</div>
	</main>


	

	<footer class="main-footer">
		<p class="footer-copy">&copy; 2026 NeoStrid - Victor Paz.</p>
		<div class="social-container">
			<a href="https://www.tiktok.com/@matipaz3"><img
				src="img/tik-tok.png" class="social" alt="tiktok
            "></a>
			<a href="#"><img src="img/facebook.png" class="social"></a> <a
				href="#"><img src="img/instagram.png" class="social"></a> <a
				href="https://github.com/VicttorPaz"><img src="img/github.png"
				class="social"></a> <a
				href="https://www.linkedin.com/in/victor-paz"><img
				src="img/linkedin.png" class="social"></a>
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