<%@page import="ar.org.centro8.curso.java.web.utils.TableHTML"%>
<%@page import="ar.org.centro8.curso.java.connectors.Connector"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.jdbc.ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.repositories.interfaces.I_ClienteRepository"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.entities.Cliente"%>
<%@page import="ar.org.centro8.curso.java.aplicaciones.enums.TipoDocumento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%I_ClienteRepository cr = new ClienteRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styleClientes.css"/>
        <title>Mantenimiento de Clientes</title>
    </head>
    <body>
        <h1>Alta de Clientes</h1>
        <form>
            <table id="tableAlta">
                <tr>
                    <td class="labelAlta">Nombre:</td>
                    <td><input type="text" name="nombre" required style="width: 200px"/></td>
                </tr>
                <tr>
                    <td class="labelAlta">Apellido:</td>
                    <td><input type="text" name="apellido" required style="width: 200px"/></td>
                </tr>
                <tr>
                    <td class="labelAlta">Direccion:</td>
                    <td><input type="text" name="direccion" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td class="labelAlta">Email:</td>
                    <td><input type="email" name="email" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td class="labelAlta">Telefono:</td>
                    <td><input type="text" name="telefono" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td class="labelAlta">Tipo de Documento:</td>
                    <td>
                        <select name="tipoDocumento" style="width: 208px">
                            <%
                                for(TipoDocumento td: TipoDocumento.values()){
                                    out.println("<option value='"+td.toString()+"'>"+td.toString().toUpperCase()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="labelAlta">Numero Documento:</td>
                    <td><input type="number" name="numeroDocumento" required style="width: 200px"/></td>
                </tr>
                <tr>
                    <td>
                        <input type="reset" value="Borrar"/>
                        <input type="submit" value="Enviar"/>
                    </td>
                </tr>
            </table>
        </form>    
        
        <%
                try {
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String direccion = request.getParameter("direccion");
                    String email = request.getParameter("email");
                    String telefono = request.getParameter("telefono");
                    String tipoDocumento = request.getParameter("tipoDocumento");
                    int numeroDocumento = Integer.parseInt(request.getParameter("numeroDocumento"));                    

                    Cliente cliente = new Cliente(nombre, apellido, direccion, email, telefono, TipoDocumento.valueOf(tipoDocumento), numeroDocumento);
                    cr.save(cliente);
                    if (cliente.getId() == 0) {
                        out.println("<h3>No se pudo dar de alta el cliente</h3>");
                    } else {
                        out.println("<h3>Se dio de alta el cliente con id:" + cliente.getId() + "</h3>");
                    }
                } catch (Exception e) {
                    System.out.println(e);
                    out.println("<h3>Error de parametros</h3>");
                }
        %>                
        
        <hr>
        
        <h2>Busqueda de Clientes</h2>
        
        <form>
            Buscar por Apellido:            <input type="text" name="buscarApellido">
            Buscar por Nombre:              <input type="text" name="buscarNombre">
            Buscar por Direccion:           <input type="text" name="buscarDireccion"><br>               
            <br>
            <input type="reset" value="Borrar"/>
            <input type="submit" value="Enviar"/>             
        </form>
        
        <br>
            
        <%
        
            try {
                String buscarApellido = request.getParameter("buscarApellido");
                String buscarNombre = request.getParameter("buscarNombre");
                String buscarDireccion = request.getParameter("buscarDireccion");
                //String buscarTipoDocumento = request.getParameter("tipoDocumento");
                
                if (buscarApellido == null) buscarApellido = "";
                if (buscarNombre == null) buscarNombre = "";
                if (buscarDireccion == null) buscarDireccion = "";
                //if (buscarTipoDocumento == null) buscarTipoDocumento = "DNI";                                 
                
                out.println(
                        new TableHTML<Cliente>()
                        .getTable(cr.getLikeNombreApellidoDireccion
                        (buscarNombre, buscarApellido, buscarDireccion),
                        "ClientesBorrar.jsp"));                                                        

            } catch (Exception e) {
                System.out.println(e);
                out.println("<h3>Error parametros</h3>");
            }

        %>
        
    </body>
</html>
