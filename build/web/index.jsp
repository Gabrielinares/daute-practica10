<%-- 
    Document   : index
    Created on : 30 sep. 2022, 16:32:08
    Author     : gabriel
--%>

<%@page import="com.modelo.Categoria"%>
<%@page import="com.modelo.Cliente" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.dao.CategoriaDAO" %>
<%@page import="com.dao.ClienteDAO" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    HttpSession sesion = request.getSession();

    String user = "";
    String acceso = "";

    if (sesion.getAttribute("usuario") != null && sesion.getAttribute("acceso") != null && sesion != null) {
        user = sesion.getAttribute("usuario").toString();
        acceso = sesion.getAttribute("acceso").toString();

        //if (acceso != "administrador") {
        //    response.sendRedirect("index.jsp");
        //}
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indice</title>
        <!-- CSS de Bootstrap -->
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container">
            <%@include file="template/menu.jsp" %>
            <h1>Bienvenido <%= user %> al sistema de Ventas</h1>
        </div>
    <https://teams.microsoft.com/l/message/19:3Ay1aS9B0KAE_Px1PfMItvHNoT84BfJLMMajXy9x8uU1@thread.tacv2/1665192449895?tenantId=30eba0aa-52f2-4167-943c-cf0fac5438a7&amp;groupId=8c26a4dd-0f0e-4c1a-a0fb-a85be9efe87e&amp;parentMessageId=1665167794497&amp;teamName=DAUTE SISV11A - PRACTICA&amp;channelName=General&amp;createdTime=1665192449895&amp;allowXTenantAccess=false>
        <!-- JS de Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/bootstrap/jquery-3.6.1.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>
