<%-- 
    Document   : proveedor-form
    Created on : 24 jul. 2022, 14:23:55
    Author     : JUAN CARVAJAL
--%>

<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Agregar Proveedor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME 5 -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    </head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #78D0FF">
                <div class="container">
                    <a href="https://www.unicauca.edu.co" class="navbar-brand" style="color: black"> Ejercicio CRUD Restaurante </a>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link btn btn-outline-info" style="color: black">Volver a la Lista</a></li>
                </ul>
                </div>               
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card" style="background-color: #78D0FF">
            <div class="card-body">                
                <c:if test="${Proveedor == null}">
                    <form action="insert2" method="post">
                </c:if>
                <caption>
                    <h2 style="text-align: center">                      
                        <c:if test="${Proveedor == null}">
                            Nuevo Proveedor       
                        </c:if>
                    </h2>
                </caption>                                 
             
                <fieldset class="form-group">
                <label>Nombre</label> <input type="text" value="<c:out value='${Proveedor.nombreProv}'/>"
                class="form-control" name="nombreProv">
                </fieldset>   
                
                <fieldset class="form-group">
                <label>Direccion</label> <input type="text" value="<c:out value='${Proveedor.direccionProv}'/>"
                class="form-control" name="direccionProv">
                </fieldset> 
                
                <fieldset class="form-group">
                <label>Telefono</label> <input type="text" value="<c:out value='${Proveedor.telefonoProv}'/>"
                class="form-control" name="telefonoProv">
                </fieldset>       
                
                <div style="text-align: center">
                    <button type="submit" class="btn btn-primary" >Guardar</button>
                </div>
                    
                </form>
            </div>
        </div>
    </div>
</body>
</html>
