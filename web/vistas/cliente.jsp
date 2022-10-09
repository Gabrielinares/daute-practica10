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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" integrity="sha512-r+ShOkTmhH/y+MOeQfVL1mW0dMcD/54nFOEmwn+gl4DCw9SAzWCqedtsefIy52x/amO1ZSsULwgDxU9BIdabqQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            <!-- Botón para agregar -->
            <button type="button" class="btn btn-primary btnAgregar" data-toggle="modal" data-target="#mdlFormulario">
                Agregar cliente
            </button>

            <hr>

            <!-- Tabla -->
            <table class="table mt-4" id="myDataTable">
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
                                    <button type="submit" class="btn btn-primary btnOcultar1" name="btnAgregar" id="btnAgregar">Agregar</button>
                                    <button type="submit" class="btn btn-success btnOcultar" name="btnEditar" id="btnEditar">Editar</button>
                                    <button type="submit" class="btn btn-danger btnOcultar" name="btnEliminar" id="btnEliminar">Eliminar</button>
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
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.all.min.js" integrity="sha512-Seif2uAXvJIyl61NjJSAr6yFQFE+DtMAPNeW99nWcSqYbC6sqvdx5yZZn9p49NZLX3bnV5imWv22P4cwtf0krg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <%
            if (request.getAttribute("msj") != null) {


        %>
        <script>
            $(document).ready(function () {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: '<%= request.getAttribute("msj")%>',
                    showConfirmButton: false,
                    timer: 3000
                }); 
            });
        </script>
        <%
            }
        %>
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>
    </body>
</html>
