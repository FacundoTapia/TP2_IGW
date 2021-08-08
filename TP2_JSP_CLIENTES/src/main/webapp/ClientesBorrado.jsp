<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_ClienteRepository cr = new ClienteRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>El articulo fue borrado exitosamente!</h1>
        
        <% 
        
            cr.remove(cr.getById(Integer.parseInt(request.getParameter("id"))));

        %>
        
        <a href="ClientesDAO.jsp">Volver</a>
    </body>
</html>
