package ar.org.centro8.curso.java.web.utils;

import java.lang.reflect.Field;
import java.util.List;

public class TableHTML<E> {
    public String getTable(List<E> lista){
        String table = "";
        
        if (lista == null || lista.isEmpty()) return table;
        
        table += "<table border=1>";
        E e = lista.get(0);
        Field campos[] = e.getClass().getDeclaredFields();
        table += "<tr>";
        for(Field f : campos) table += "<th>"+f.getName()+"</th>";
        table += "</tr>";
        for (E o : lista){
            table+="<tr>";
            for (Field f : campos){
                table += "<td>";
                String method = "get" + f.getName().substring(0, 1).toUpperCase() 
                        + f.getName().substring(1);
                //table+=method;
                try {
                    table += e.getClass().getMethod(method, null).invoke(o, null);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                table += "</td>";
            }
            table+="</tr>";
        }
        table += "</table>";
        
        return table;
    }

    public String getTable(List<E> lista, String linkDelete){
        String table = "";
        
        if (lista == null || lista.isEmpty()) return table;
        
        table += "<table border = 1>";
        E e = lista.get(0);
        Field campos[] = e.getClass().getDeclaredFields();
        table += "<tr>";
        for(Field f : campos) table += "<th>"+f.getName()+"</th>";
        table += "<th>Eliminar</th>";
        table += "</tr>";
        for (E o : lista){
            table+="<tr>";
            for (Field f : campos){
                table += "<td>";
                String method = "get" + f.getName().substring(0, 1).toUpperCase() 
                        + f.getName().substring(1);
                //table+=method;
                try {
                    table += e.getClass().getMethod(method, null).invoke(o, null);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                table += "</td>";                
            }
            try {
                table+="<td><a href="+linkDelete+"?id=" + e.getClass().getMethod("getId", null)
                        .invoke(o, null)+">Borrar</a></td>";
            } catch (Exception exx) {
                System.out.println(exx);
            }
            
            table+="</tr>";
        }
        table += "</table>";
        
        return table;
    }

    public String getTable(List<E> lista, String linkDelete, String linkUpdate){
        String table = "";
        
        if (lista == null || lista.isEmpty()) return table;
        
        table += "<table border = 1>";
        E e = lista.get(0);
        Field campos[] = e.getClass().getDeclaredFields();
        table += "<tr>";
        for(Field f : campos) table += "<th>"+f.getName()+"</th>";
        table += "<th>Eliminar</th>";
        table += "</tr>";
        for (E o : lista){
            table+="<tr>";
            for (Field f : campos){
                table += "<td>";
                String method = "get" + f.getName().substring(0, 1).toUpperCase() 
                        + f.getName().substring(1);
                //table+=method;
                try {
                    table += e.getClass().getMethod(method, null).invoke(o, null);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                table += "</td>";                
            }
            try {
                table+="<td><a href="+linkDelete+"?id=" + e.getClass().getMethod("getId", null)
                        .invoke(o, null)+">Borrar</a></td>";
            } catch (Exception exx) {
                System.out.println(exx);
            }
            try {
                table+="<td><a href="+linkUpdate+"?id=" + e.getClass().getMethod("getId", null)
                        .invoke(o, null)+">Actualizar</a></td>";
            } catch (Exception exx) {
                System.out.println(exx);
            }
            
            table+="</tr>";
        }
        table += "</table>";
        
        return table;
    }
}