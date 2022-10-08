<%-- 
    Document   : login
    Created on : 7 oct. 2022, 18:24:54
    Author     : gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Usuario" %>
<%@page import="java.util.ArrayList" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..::Login::..</title>
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <section class="vh-100" style="background-color: #508bfc;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5">
                                <h3 class="mb-5 text-center"><b>Sign in</b></h3>
                                <hr class="my-4">
                                <form action="${pageContext.servletContext.contextPath}/LoginServlet" method="POST">
                                    <div class="form-outline mb-4">
                                        <label class="form-label"><b>Usuario</b></label>
                                        <input type="text" name="txtUser" class="form-control form-control-lg" />              
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label"><b>Password</b></label>
                                        <input type="password" name="txtPass" class="form-control form-control-lg" />              
                                    </div>
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-danger btn-lg " name="btnLogin" type="submit">Login</button>
                                    </div>
                                </form>                      
                                <hr class="my-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
            HttpSession sesion = request.getSession();
            
            if (session.getAttribute("logged_in") != null){
                response.sendRedirect("index.jsp");
            }
            
            if (request.getAttribute("msj") != null) {
        %>
        <script> alert('<%= request.getAttribute("msj")%>');</script>
        <%            }
            ArrayList<Usuario> lista = new ArrayList<>();
            if (request.getAttribute("datos") != null) {
                lista = (ArrayList<Usuario>) request.getAttribute("datos");
                String user = "";
                String acceso = "";
                for (Usuario datos : lista) {
                    user = datos.getUsername();
                    acceso = datos.getNivelAcceso();
                }
                sesion.setAttribute("usuario", user);
                sesion.setAttribute("acceso", acceso);
                sesion.setAttribute("logged_in", "activa");

                response.sendRedirect("index.jsp");
            }
        %>
        <!-- Validacion cierre de sesion -->
        <%
            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();
            }
        %>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/jquery-3.6.1.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/bootstrap/bootstrap.min.js"></script> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>