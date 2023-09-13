<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%
    if(session.getAttribute("listapro") == null){
      ArrayList<Producto> lisaux = new ArrayList<Producto>();
      session.setAttribute("listapro", lisaux);
    }
    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("listapro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 0; 
            padding: 0; 
        }

        .contenedor-principal{
            display: flex;
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
            height: 40vh;
            background-color: #f0f0f0; 
        }
        

        .cuadro {
            background-color: #F0F0F0; 
            padding: 0px; 
            border: 3px solid #000; 
            width: 800px; 
            text-align: center; 
        }

        .cuadro h1 {
           margin: 0;
           padding: 5px;
           font-size: 24px; 
        }

        .cuadro p {
            font-size: 12px; 
        }

        .tabla {
            border-collapse: collapse;
            width: 50%; 
            text-align: center; 
            border: 1px solid #000; 

        .tabla th, .tabla td {
            padding: 10px;
            border: 1px solid #000; 
        }

        .nuevo-producto {
            margin-top: 20px; 
        }
    </style>
</head>
<body>
    <div class="contenedor-principal">
        <div class="cuadro">
            <h1>Primer Parcial TEM-742</h1>
            <p>Nombre: OSCAR FIDEL HUANCA QUISPE</p>
            <p>Carnet: 4885439</p>
        </div>
        <h1 style="font-size: 36px;">Gestion de Productos</h1>
        <a href="MainServlet?op=nuevo" class="nuevo-producto">Nuevo Producto</a>
        <table class="tabla" border="1">
            <tr>
               <th>Id</th>
               <th>Descripcion</th>
               <th>Cantidad</th>
               <th>Precio</th>
               <th>Categoria</th>
               <th></th>
               <th></th>
            </tr> 
            <% if (lista !=null){
               for(Producto item : lista){
            %>
            <tr>
               <td><%= item.getId() %></td>
               <td><%= item.getDescripcion()%></td>
               <td><%= item.getCantidad() %></td>
               <td><%= item.getPrecio() %></td>
               <td><%= item.getCategoria() %></td>
               <td>
                   <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a> 
               </td>
               <td>
                <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                   onclick="return(confirm('esta seguro de eliminar?'))"
                   >Eliminar</a>   
               </td>
            </tr> 
            <%
            }
        }
            %>
        </table>
    </div>
</body>
</html>
