<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Proceso de Baja de Clientes</h1>
        <h3>Esta seguro que desea borrar el articulo con id <% out.println(request.getParameter("id")); %></h3>
        <form action="ClientesBorrado.jsp">
            <a 
                href=<% out.print("'ClientesBorrado.jsp?id="+request.getParameter("id")+"'");%>>Borrar
            </a>
                <a href="ClientesDAO.jsp">Volver</a>
        </form>
    </body>
</html>
