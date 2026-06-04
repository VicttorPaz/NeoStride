<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>NeoStride - Login</title>
</head>
<body class="bg-light">

	<div class="container mt-5" style="max-width: 600px;">
		<div class="card shadow border-0">
			<div class="card-header bg-dark text-white text-center py-3">
				<h2 class="mb-0 h4">Ingreso al sistema</h2>
			</div>
			<div class="card-body p-4">
			
				<% if (request.getAttribute("error") != null) { %>
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						<%= request.getAttribute("error") %>
						<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
				<% } %>

				<form action="acceso.jsp" method="post" id="formLogin"
					class="row g-3" novalidate>
					
					<div class="col-12">
						<label for="email" class="form-label fw-bold">Correo Electrónico</label> 
						<input type="email" class="form-control" id="email" name="correo" placeholder="usuario@ejemplo.com" required>
					</div>
					
					<div class="col-12">
						<label for="clave" class="form-label fw-bold">Contraseña</label> 
						<input type="password" class="form-control" id="clave" name="password" required>
					</div>
					
					<div class="col-12 mt-4 text-center">
						<button type="submit" class="btn btn-danger px-5 fw-bold">Login</button>
						<button type="reset" class="btn btn-secondary px-5">Limpiar</button>
					</div>
					
					<div class="col-12 text-center mt-4">
						<hr class="text-muted">
						<p class="mb-2 text-muted">¿Aún no tienes cuenta?</p>
						<a href="register.jsp" class="btn btn-outline-dark shadow-sm">
							<i class="bi bi-person-plus-fill"></i> Registrar Nuevo Usuario
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>