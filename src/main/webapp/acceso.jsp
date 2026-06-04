<%@ page import="com.productos.seguridad.Usuario" %>
<%@ page import="com.productos.datos.Conexion" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String correoParam = request.getParameter("correo");
    String passParam = request.getParameter("password");

    if (correoParam == null || correoParam.trim().isEmpty() || 
        passParam == null || passParam.trim().isEmpty()) {
        
        request.setAttribute("error", "¡Por favor, escribe tu correo y contraseña!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    Conexion con = new Conexion();
    PreparedStatement pr = null;
    ResultSet rs = null;

    String sql = "SELECT cedula_us, nombre_us, correo_us, clave_us FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";

    try {
        if (con.getConexion() == null) {
            request.setAttribute("error", "Error: No hay conexión con la base de datos de NeoStrid.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        pr = con.getConexion().prepareStatement(sql);
        pr.setString(1, correoParam.trim());
        pr.setString(2, passParam.trim());

        rs = pr.executeQuery();

        if (rs.next()) {
            Usuario usuario = new Usuario();
            usuario.setCedula(rs.getString("cedula_us"));
            usuario.setNombre(rs.getString("nombre_us"));
            usuario.setCorreo(rs.getString("correo_us"));

            HttpSession sesionActiva = request.getSession(true);
            
            sesionActiva.setAttribute("usuarioLogueado", usuario);
            
            response.sendRedirect("inicio.jsp");
            return;
        } else {
            request.setAttribute("error", "❌ ¡Tu correo o contraseña no son correctos! Inténtalo otra vez.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

    } catch (Exception ex) {
        request.setAttribute("error", "Error en el sistema: " + ex.getMessage());
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } finally {
        try {
            if (rs != null) rs.close();
            if (pr != null) pr.close();
        } catch (Exception e) {
            System.out.println("Error al cerrar recursos de login: " + e.getMessage());
        }
    }
%>