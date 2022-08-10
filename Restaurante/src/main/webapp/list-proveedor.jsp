<%-- 
    Document   : list-proveedor
    Created on : 24 jul. 2022, 11:42:39
    Author     : JUAN CARVAJAL
--%>

<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Lista de Proveedor</title>
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
        <div class="row">
            <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
            <div class="container">
                <h3 class="text-center">Lista de Proveedor con sus Productos y Categoria</h3>
                <hr>
                <br>
                <table class="table table-bordered" style="text-align: center">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Categoria</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- for (Todo todo: todos) { -->      
                        <c:forEach var="producto" items="${Proveedor.productosList}">
                            <tr>                                       
                                <td>
                                    <c:out value="${Proveedor.nombreProv}" />
                                </td>
                            
                                <td>                                          
                                    <c:out value="${producto.descripcionProd}" /><br/>                                           
                                </td>
                                <td>                                          
                                    <c:out value="${producto.precioProd}" /><br/>                                           
                                </td>
                                <td>                                                                                        
                                    <c:out value="${producto.idCatFk.descripcionCat}" /><br/>                                           
                                </td>
                                <td>
                                            <a href="edit2?idProv=<c:out value='${Proveedor.idProv}' />&idProd=<c:out value='${producto.idProd}' />&idCat=<c:out value='${producto.idCatFk.idCat}' />" class="btn btn-outline-secondary"><i class="fas fa-marker"></i></a>
                                &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete2?idProd=<c:out value='${producto.idProd}' />" class="btn btn-outline-danger"><i class="far fa-trash-alt"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
