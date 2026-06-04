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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/products.css">
      <link rel="stylesheet" href="styles/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <title>NeoStrid</title>
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

        <div class="products-grid">
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Nike Air Max Active</h3>
                <p class="product-price">$120.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>

            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Jordan Retro High</h3>
                <p class="product-price">$180.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>

            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Nike Free Run V</h3>
                <p class="product-price">$110.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>

            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1539185441755-769473a23570?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">New Balance 574</h3>
                <p class="product-price">$95.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>

            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Puma Classic Street</h3>
                <p class="product-price">$85.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>

            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1552346154-21d32810aba3?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Adidas Forum Low</h3>
                <p class="product-price">$130.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1552346154-21d32810aba3?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Adidas Forum Low</h3>
                <p class="product-price">$130.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1552346154-21d32810aba3?w=400" alt="Zapato" class="product-img">
                <h3 class="product-title">Adidas Forum Low</h3>
                <p class="product-price">$130.00</p>
                <button class="btn-cart"><i class="bi bi-cart-plus"></i></button>
            </div>
        </div>
    </main>

    <footer class="main-footer">
        <p class="footer-copy">&copy; 2026 NeoStrid - Victor Paz.</p>
        <div class="social-container">
            <a href="https://www.tiktok.com/@matipaz3"><img src="img/tik-tok.png" class="social"></a> 
            <a href="#"><img src="img/facebook.png" class="social"></a>
            <a href="#"><img src="img/instagram.png" class="social"></a>
            <a href="https://github.com/VicttorPaz"><img src="img/github.png" class="social"></a>
            <a href="https://www.linkedin.com/in/victor-paz"><img src="img/linkedin.png" class="social"></a>
        </div>
    </footer>
</body>
</html>