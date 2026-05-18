<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<title>NeoStride</title>
</head>
<body>

	<div class="container mt-5">
		<div class="card shadow">
			<div class="card-header bg-primary text-white">
				<h2 class="mb-0">Ingreso al sistema</h2>
			</div>
			<div class="card-body">
				<form action="acceso.jsp" method="post" id="formLogin"
					class="row g-1" novalidate>
					<!-- 1. Email -->
					<div class="col-md-6">
						<label for="email" class="form-label">Correo Electrónico</label> <input
							type="email" class="form-control" id="email" name="txtEmail"
							placeholder="usuario@ejemplo.com" required>
					</div>
					<!-- 2. Password -->
					<div class="col-md-6">
						<label for="clave" class="form-label">Contraseña</label> <input
							type="password" class="form-control" id="clave" name="txtClave"
							required>
					</div>
					<!-- 3. Botones -->
					<div class="col-12 mt-4 text-center">
						<button type="submit" class="btn btn-primary px-5">Login</button>
						<button type="reset" class="btn btn-secondary px-5">Limpiar</button>
					</div>
					<aside>

						<div class="container text-center mt-5">
							<h3>¿Aún no tienes cuenta?</h3>
							<a href="register.jsp" class="btn btn-success btn-lg shadow">
								<i class="bi bi-person-plus-fill"></i> Registrar Nuevo Usuario
							</a>
						</div>

					</aside>
				</form>
			</div>
		</div>
	</div>
</body>
</html>