<%-- 
    Document   : menu
    Created on : 30 sep. 2022, 16:33:52
    Author     : gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Sistema de ventas</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.servletContext.contextPath}/index.jsp">Inicio</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/cliente.jsp">Cliente</a>
            </li>
        </ul>
    </div>
</nav>