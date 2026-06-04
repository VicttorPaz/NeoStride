<%@ page import="com.productos.seguridad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String correo = request.getParameter("txtEmail");
    String clave = request.getParameter("txtClave");
    String residencia = request.getParameter("rdResidencia");
    String fechaNacimiento = request.getParameter("mFecha");
    String colorFavorito = request.getParameter("cColor");
    String foto = request.getParameter("fileFoto");
    String estadoStr = request.getParameter("cmbEstado");


    int idEstado = 1; 
    if("casado".equals(estadoStr)) idEstado = 2;
    if("divorciado".equals(estadoStr)) idEstado = 3;
    if("viudo".equals(estadoStr)) idEstado = 4;


    String nombreProvincia = "Provincia no válida / Exterior";
    boolean provinciaValida = false;
    
    if (cedula != null && cedula.length() >= 2) {
        try {
            int cod = Integer.parseInt(cedula.substring(0, 2));
            
            if (cod == 1) { nombreProvincia = "Azuay"; provinciaValida = true; }
            else if (cod == 2) { nombreProvincia = "Bolívar"; provinciaValida = true; }
            else if (cod == 3) { nombreProvincia = "Cañar"; provinciaValida = true; }
            else if (cod == 4) { nombreProvincia = "Carchi"; provinciaValida = true; }
            else if (cod == 5) { nombreProvincia = "Cotopaxi"; provinciaValida = true; }
            else if (cod == 6) { nombreProvincia = "Chimborazo"; provinciaValida = true; }
            else if (cod == 7) { nombreProvincia = "El Oro"; provinciaValida = true; }
            else if (cod == 8) { nombreProvincia = "Esmeraldas"; provinciaValida = true; }
            else if (cod == 9) { nombreProvincia = "Guayas"; provinciaValida = true; }
            else if (cod == 10) { nombreProvincia = "Imbabura"; provinciaValida = true; }
            else if (cod == 11) { nombreProvincia = "Loja"; provinciaValida = true; }
            else if (cod == 12) { nombreProvincia = "Los Ríos"; provinciaValida = true; }
            else if (cod == 13) { nombreProvincia = "Manabí"; provinciaValida = true; }
            else if (cod == 14) { nombreProvincia = "Morona Santiago"; provinciaValida = true; }
            else if (cod == 15) { nombreProvincia = "Napo"; provinciaValida = true; }
            else if (cod == 16) { nombreProvincia = "Pastaza"; provinciaValida = true; }
            else if (cod == 17) { nombreProvincia = "Pichincha"; provinciaValida = true; }
            else if (cod == 18) { nombreProvincia = "Tungurahua"; provinciaValida = true; }
            else if (cod == 19) { nombreProvincia = "Zamora Chinchipe"; provinciaValida = true; }
            else if (cod == 20) { nombreProvincia = "Galápagos"; provinciaValida = true; }
            else if (cod == 21) { nombreProvincia = "Sucumbíos"; provinciaValida = true; }
            else if (cod == 22) { nombreProvincia = "Orellana"; provinciaValida = true; }
            else if (cod == 23) { nombreProvincia = "Santo Domingo de los Tsáchilas"; provinciaValida = true; }
            else if (cod == 24) { nombreProvincia = "Santa Elena"; provinciaValida = true; }
            else if (cod == 30) { nombreProvincia = "Registrado en el Exterior"; provinciaValida = true; }
        } catch (NumberFormatException e) {
            nombreProvincia = "Formato de cédula incorrecto";
        }
    }

    String mensajeRegistro = "";
    boolean camposCompletos = true;

 
    if (nombre == null || nombre.trim().isEmpty() ||
        cedula == null || cedula.trim().isEmpty() ||
        correo == null || correo.trim().isEmpty() ||
        clave == null || clave.trim().isEmpty() ||
        fechaNacimiento == null || fechaNacimiento.trim().isEmpty()) {
        
        camposCompletos = false;
        mensajeRegistro = "Error: Registro cancelado. Todos los campos obligatorios deben estar llenos.";
    } else if (!provinciaValida) {
        camposCompletos = false;
        mensajeRegistro = "Error: Registro cancelado. La provincia asignada a la cédula no pertenece a Ecuador.";
    }


    if (camposCompletos) {
        Usuario verificador = new Usuario();
        String estadoDuplicados = verificador.verifyuser(cedula, correo, nombre);
        
        if (!"OK".equals(estadoDuplicados)) {
    
            camposCompletos = false;
            mensajeRegistro = "Error: Registro cancelado. " + estadoDuplicados;
        } else {

            Usuario user = new Usuario(2, nombre, cedula, idEstado, correo, clave);
            mensajeRegistro = user.ingresarCliente();
            
 
            if (mensajeRegistro != null && mensajeRegistro.contains("correcta")) {
                HttpSession sesionActiva = request.getSession(true);
                sesionActiva.setAttribute("usuarioLogueado", user);
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultado - NeoStrid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
   
        <div class="alert <%= (mensajeRegistro != null && mensajeRegistro.contains("correcta") && camposCompletos) ? "alert-success" : "alert-danger" %> shadow">
            <h3><%= mensajeRegistro %></h3>
            <p>Estado del proceso: <strong><%= (mensajeRegistro != null && mensajeRegistro.contains("correcta") && camposCompletos ? "Guardado en PostgreSQL" : "Registro denegado") %></strong></p>
        </div>

        <div class="card shadow-sm mt-3">
            <div class="card-body">
                <h5>Resumen de datos enviados:</h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Nombre:</strong> <%= (nombre != null && !nombre.isEmpty()) ? nombre : "<span class='text-danger'>Faltante</span>" %></li>
                    <li class="list-group-item"><strong>Correo:</strong> <%= (correo != null && !correo.isEmpty()) ? correo : "<span class='text-danger'>Faltante</span>" %></li>
                    <li class="list-group-item"><strong>Cédula:</strong> <%= (cedula != null && !cedula.isEmpty()) ? cedula : "<span class='text-danger'>Faltante</span>" %></li>
                    <li class="list-group-item text-primary"><strong>Provincia de Origen:</strong> <strong><%= nombreProvincia %></strong></li>
                    <li class="list-group-item"><strong>Zona de Residencia:</strong> <%= residencia %></li>
                    <li class="list-group-item"><strong>Mes/Año Nacimiento:</strong> <%= (fechaNacimiento != null && !fechaNacimiento.isEmpty()) ? fechaNacimiento : "<span class='text-danger'>Faltante</span>" %></li>
                </ul>
                <div class="mt-4">
             
                    <a href="inicio.jsp" class="btn btn-outline-primary">Ir a la página de Inicio</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>