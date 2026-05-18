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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container mt-5">
		<div class="card shadow">
			<div class="card-header bg-danger text-black">
				<h2 class="mb-0">Formulario de Registro</h2>
			</div>
			<div class="card-body">
				<form action="respuesta.jsp" method="post" id="formRegistro"
					class="row g-3 needs-validation" novalidate>
					<div class="col-md-6">
						<label for="nombre" class="form-label">Nombre Completo</label> <input
							type="text" class="form-control" id="nombre" name="txtNombre"
							required>
						<div class="invalid-feedback">Por favor, ingrese su nombre completo.</div>
					</div>
					<div class="col-md-6">
						<label for="cedula" class="form-label">Cédula</label> <input
							type="text" class="form-control" id="cedula" name="txtCedula"
							maxlength="10" pattern="\d{10}" placeholder="Ej: 172244..."
							required>
						<div id="provinciaDetectada"
							class="form-text text-primary fw-bold"></div>
						<div class="invalid-feedback" id="errorCedula">Debe ingresar exactamente 10 números.</div>
					</div>
					<div class="col-md-12">
						<label for="estado" class="form-label">Estado Civil</label> <select
							class="form-select" id="estado" name="cmbEstado">
							<option value="soltero">Soltero</option>
							<option value="casado">Casado</option>
							<option value="divorciado">Divorciado</option>
							<option value="viudo">Viudo</option>
						</select>
					</div>
					<div class="col-md-4">
						<label class="form-label d-block">Residencia</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="rdResidencia"
								value="Sur" checked> <label class="form-check-label">Sur</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="rdResidencia"
								value="Norte"> <label class="form-check-label">Norte</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="rdResidencia"
								value="Centro"> <label class="form-check-label">Centro</label>
						</div>
					</div>
					<div class="col-md-4">
						<label for="foto" class="form-label">Foto de Perfil</label> <input
							type="file" class="form-control" id="foto" name="fileFoto"
							accept=".jpg, .jpeg, .png">
					</div>
					<div class="col-md-4">
						<label for="fecha" class="form-label">Mes/Año Nacimiento</label> <input
							type="month" class="form-control" id="fecha" name="mFecha"
							required>
						<div class="invalid-feedback">Por favor, seleccione su fecha de nacimiento.</div>
					</div>
					<div class="col-md-12">
						<label for="color" class="form-label">Color Favorito</label> <input
							type="color" class="form-control form-control-color w-100"
							id="color" name="cColor" value="#563d7c">
					</div>
					<div class="col-md-6">
						<label for="email" class="form-label">Correo Electrónico</label> <input
							type="email" class="form-control" id="email" name="txtEmail"
							placeholder="usuario@ejemplo.com" required>
						<div class="invalid-feedback">Por favor, ingrese un correo electrónico válido.</div>
					</div>
					<div class="col-md-6">
						<label for="clave" class="form-label">Contraseña</label> <input
							type="password" class="form-control" id="clave" name="txtClave"
							required>
						<div class="invalid-feedback">Por favor, ingrese su contraseña.</div>
					</div>
					<div class="col-12 mt-4 text-center">
						<button type="submit" class="btn btn-primary px-5">Registrar</button>
						<button type="reset" class="btn btn-secondary px-5">Borrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		(() => {
		  'use strict'

		  const form = document.getElementById('formRegistro');
		  const cedulaInput = document.getElementById('cedula');
		  const provinciaTexto = document.getElementById('provinciaDetectada');
		  const errorCedula = document.getElementById('errorCedula');

		  // Validar cédula y detectar provincia mientras se escribe
		  cedulaInput.addEventListener('input', () => {
			  const cedula = cedulaInput.value;
			  
			  if (cedula.length >= 2) {
				  const cod = parseInt(cedula.substring(0, 2), 10);
				  // Rango oficial de provincias de Ecuador (01-24 o 30)
				  const esProvinciaValida = (cod >= 1 && cod <= 24) || cod === 30;

				  if (!esProvinciaValida) {
					  provinciaTexto.textContent = "";
					  errorCedula.textContent = "Código de provincia inválido para Ecuador (Use de 01-24 o 30).";
					  cedulaInput.setCustomValidity("Provincia inválida"); // Bloquea el submit
				  } else {
					  cedulaInput.setCustomValidity(""); // Permite el submit
					  
					  let prov = "";
					  if (cod === 1) prov = "Azuay";
					  else if (cod === 2) prov = "Bolívar";
					  else if (cod === 3) prov = "Cañar";
					  else if (cod === 4) prov = "Carchi";
					  else if (cod === 5) prov = "Cotopaxi";
					  else if (cod === 6) prov = "Chimborazo";
					  else if (cod === 7) prov = "El Oro";
					  else if (cod === 8) prov = "Esmeraldas";
					  else if (cod === 9) prov = "Guayas";
					  else if (cod === 10) prov = "Imbabura";
					  else if (cod === 11) prov = "Loja";
					  else if (cod === 12) prov = "Los Ríos";
					  else if (cod === 13) prov = "Manabí";
					  else if (cod === 14) prov = "Morona Santiago";
					  else if (cod === 15) prov = "Napo";
					  else if (cod === 16) prov = "Pastaza";
					  else if (cod === 17) prov = "Pichincha";
					  else if (cod === 18) prov = "Tungurahua";
					  else if (cod === 19) prov = "Zamora Chinchipe";
					  else if (cod === 20) prov = "Galápagos";
					  else if (cod === 21) prov = "Sucumbíos";
					  else if (cod === 22) prov = "Orellana";
					  else if (cod === 23) prov = "Santo Domingo de los Tsáchilas";
					  else if (cod === 24) prov = "Santa Elena";
					  else if (cod === 30) prov = "Exterior";
					  
					  provinciaTexto.textContent = "📍 Provincia: " + prov;
				  }
			  } else {
				  provinciaTexto.textContent = "";
				  errorCedula.textContent = "Debe ingresar exactamente 10 números.";
				  cedulaInput.setCustomValidity("Cédula incompleta");
			  }
		  });

		  // Interceptar submit del formulario
		  form.addEventListener('submit', event => {
			  if (!form.checkValidity()) {
				  event.preventDefault();
				  event.stopPropagation();
			  }
			  form.classList.add('was-validated');
		  }, false);
		  
		})()
	</script>
</body>

<footer class="main-footer">
	<p class="footer-copy">&copy; 2026 NeoStrid - Victor Paz.</p>
	<div class="social-container">
		<a href="https://www.tiktok.com/@matipaz3"><img src="img/tik-tok.png" class="social"></a> 
		<a href="#"><img src="img/facebook.png" class="social"></a> 
		<a href="#"><img src="img/instagram.png" class="social"></a> 
		<a href="https://github.com/VicttorPaz"><img src="img/github.png" class="social"></a> 
		<a href="https://www.linkedin.com/in/victor-paz-85533221b/"><img src="img/linkedin.png" class="social"></a>
	</div>
</footer>

</html>