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
        <title>Cliente</title>
        <!-- CSS de Bootstrap -->
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.css"/>
        <!-- JS de Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/bootstrap/jquery-3.6.1.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.js"></script> 
    </head>
    <body>       
        <%
            CategoriaDAO cdao = new CategoriaDAO();
            ClienteDAO clienteDAO = new ClienteDAO();
        %>
        <%@include file="../template/menu.jsp" %>
        <div class="container mt-4">
            <h1>Clientes</h1>
            <hr>
            <!-- Botón para agregar -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mdlFormulario">
                Agregar cliente
            </button>

            <!-- Tabla -->
            <table class="table mt-4">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Cliente> listCliente = clienteDAO.mostrarClientes();
                        for (Cliente elem : listCliente) {

                    %>
                    <tr>
                        <td class="codigo"><%= elem.getIdCliente()%></td>
                        <td class="nombre"><%= elem.getNombre()%></td>
                        <td class="edad"><%= elem.getEdad()%></td>
                        <td class="categoria"><%= elem.getCategoria()%></td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-success btnEditar" data-toggle="modal" data-target="#mdlFormulario">Editar</button>
                                <button type="button" class="btn btn-danger btnEliminar" data-toggle="modal" data-target="#mdlFormulario">Eliminar</button>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Modal para agregar-->
            <div class="modal fade" id="mdlFormulario" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Cliente</h5>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.servletContext.contextPath}/ClienteServlet" method="POST" role="form">
                                Código
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                Nombre
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control">
                                Edad
                                <input type="number" name="txtEdad" id="txtEdad" class="form-control">
                                Categoría
                                <select name="txtCategoria" id="txtCategoria" class="form-control" >

                                    <%
                                        ArrayList<Categoria> lista = cdao.mostrarCategorias();
                                        for (Categoria elem : lista) {


                                    %>
                                    <option value="<%= elem.getIdCategoria()%>"> <%= elem.getCategoria()%> </option>
                                    <% } %>

                                </select>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" name="btnAgregar" id="btnAgregar">Agregar</button>
                                    <button type="submit" class="btn btn-success" name="btnEditar" id="btnEditar">Editar</button>
                                    <button type="submit" class="btn btn-danger" name="btnEliminar" id="btnEliminar">Eliminar</button>
                                    <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/jquery-3.6.1.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <%
            if (request.getAttribute("msj") != null) {


        %>
        <script>alert('<%= request.getAttribute("msj")%>')</script>
        <%
            }
        %>
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>
    </body>
</html>
