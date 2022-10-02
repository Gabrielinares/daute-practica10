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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%! 
            CategoriaDAO cdao = new CategoriaDAO();
            ClienteDAO clienteDAO  = new ClienteDAO();
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
                        <td class="codigo"><%= elem.getIdCliente() %></td>
                        <td class="nombre"><%= elem.getNombre()%></td>
                        <td class="edad"><%= elem.getEdad()%></td>
                        <td class="categoria"><%= elem.getIdCategoria() %></td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mdlFormulario" id="editar">Editar</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mdlFormulario" id="eliminar">Eliminar</button>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Modal para agregar-->
            <div class="modal fade" id="mdlFormulario">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Cliente</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="${pageContext.servletContext.contextPath}/ClienteServlet" method="POST">
                            <div class="modal-body">

                                Código
                                <input type="text" name="txtCodigo" id="txtCodigo" class="form-control" value="0" readonly>
                                Nombre
                                <input type="text" name="txtNombre" id="txtNombre" class="form-control">
                                Edad
                                <input type="number" name="txtEdad" id="txtEdad" class="form-control">
                                Categoría
                                <select name="sCategoria" class="form-control" id="sCategoria">

                                    <%
                                        ArrayList<Categoria> lista = cdao.mostrarCategorias();
                                        for (Categoria elem : lista) {
                                                
                                            
                                    %>
                                    <option value="<%= elem.getIdCategoria() %>"> <%= elem.getCategoria() %> </option>
                                    <% } %>

                                </select>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <button class="btn btn-primary" name="btnAgregar" id="btnAgregar">Agregar</button>
                                <button class="btn btn-success" name="btnEditar" id="btnEditar">Editar</button>
                                <button class="btn btn-danger" name="btnEliminar" id="btnEliminar">Eliminar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
