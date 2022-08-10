<%-- 
    Document   : list-datos
    Created on : 18 jul. 2022, 18:41:41
    Author     : JUAN CARVAJAL
--%>

<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
    <head>
        <title>Lista de Proveedores</title>
        
        <script src="https://kit.fontawesome.com/e5c5dcc354.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- FONT AWESOME 5 -->
        
        <style>
            html,body{
                margin: 0;
                padding: 0;
            }
            .main{
                background-image: url(https://images8.alphacoders.com/718/718915.jpg);
                width: 100vw;
                height: auto;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #78D0FF">
                <div class="container">
                    <a href="https://www.unicauca.edu.co" class="navbar-brand" style="color: black"> Ejercicio CRUD Restaurante </a>
                <ul class="navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/list" class="nav-link btn btn-info" style="color: black"><i class="fa fa-home" aria-hidden="true"></i></a></li>&nbsp;&nbsp;
                    <li><a href="<%=request.getContextPath()%>/login" class="nav-link btn btn-info" style="color: black"><i class="fa fa-sign-out" aria-hidden="true"></i></a></li>&nbsp;&nbsp;
                    
                    <div class="nav-link btn btn-info">
                        <a style="color: black"><i class="fa-solid fa-circle-user"></i>&nbsp;&nbsp; ${sessionScope.usuario.usuario}</a>                                            
                    </div>
                </ul>
                </div>             
            </nav>
        </header>
        <div class="main">
        <br>
        <div class="row" >
            <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
            <div style="width: 100%;">
                <h3 class="text-center">Lista de Proveedores con sus Productos y Categoria</h3>
                <hr>
                <div class="container" style="text-align: center">
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-info">Nuevo Producto</a>
                    <a href="<%=request.getContextPath()%>/new2" class="btn btn-info">Nuevo Proveedor</a>
                    
                </div>
                <br>
                
                <style type="text/css">
                    th{
                        background-color: lightblue;
                    }
                    td{
                        background-color: lightcyan;
                    }
                </style>
                
                <table class="table table-bordered" style="text-align: center; width: 85%;margin: 0 auto;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Categoria</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="proveedor" items="${listProveedores}">                           
                                    <tr>
                                        <td>
                                            <c:out value="${proveedor.idProv}" /> 
                                           
                                        </td>
                                        <td>
                                            <c:out value="${proveedor.nombreProv}" />
                                        </td>
                                        <td>
                                            <c:out value="${proveedor.direccionProv}" />
                                        </td>
                                        <td>
                                            <c:out value="${proveedor.telefonoProv}" />
                                        </td>
                                        <td>
                                            <c:forEach var="producto" items="${proveedor.productosList}">
                                            <c:out value="${producto.descripcionProd}" /><br/>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach var="producto" items="${proveedor.productosList}">
                                            <c:out value="${producto.precioProd}" /><br/>
                                            </c:forEach>
                                        </td>
                                        <td>                                             
                                            <c:forEach var="producto" items="${proveedor.productosList}">
                                                        <c:out value="${producto.idCatFk.descripcionCat}" /><br/>
                                            </c:forEach>
                                        </td>
                                        <td>
                                                    <a href="edit?idProv=<c:out value='${proveedor.idProv}' />" class="btn btn-outline-secondary"><i class="fa-solid fa-pen-to-square"></i></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?idProv=<c:out value='${proveedor.idProv}' />" class="btn btn-outline-danger"><i class="fa-solid fa-trash-can"></i></a>
                                        </td>
                                    </tr>  
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
    
    </body>
</html>