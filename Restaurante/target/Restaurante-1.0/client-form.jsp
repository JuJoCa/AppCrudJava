<%-- 
    Document   : client-form
    Created on : 21 jul. 2022, 12:31:36
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
        <div class="card"  style="background-color: #78D0FF">
            <div class="card-body">
                <c:if test="${Proveedor != null}">
                    <form action="update" method="post">
                </c:if>
                        
                <c:if test="${Proveedor == null}">
                    <form action="insert" method="post">
                </c:if>
                <caption>
                    <h2 style="text-align: center">
                        <c:if test="${Proveedor != null}">                          
                            Editar Producto
                        </c:if>

                        <c:if test="${Proveedor == null}">
                            Nuevo Producto       
                        </c:if>
                    </h2><br>
                </caption>

                <c:if test="${Proveedor != null}">
                    <input type="hidden" name="idProv" value="<c:out value='${Proveedor.idProv}' />" />
                </c:if>
                
                <c:if test="${Proveedor == null}">
                    <fieldset class="form-group">
                        <label>Proveedor</label><br>
                        <select name="listaproveedores" id="listaproveedores" class="form-control">
                            <c:forEach var="Proveedor" items="${listProveedores}">
                                <option name="<c:out value='${Proveedor.idProv}'/>" value="<c:out value='${Proveedor.idProv}'/>"><c:out value='${Proveedor.nombreProv}'/></option>
                            </c:forEach>
                        </select>                   
                    </fieldset>
                </c:if>
             
                <c:if test="${Proveedor != null}">
                    <fieldset class="form-group">
                    <label>Nombre Proveedor</label> <input type="text" value="<c:out value='${Proveedor.nombreProv}'/>" readonly onmousedown="return false;" 
                    class="form-control" name="nombreProv" readonly onmousedown="return false;">
                    </fieldset>
                    
                </c:if>
                    
                <c:if test="${Proveedor != null}">
                    <input type="hidden" name="idProd" value="<c:out value='${Producto.idProd}' />" />
                </c:if>    
                    
                <fieldset class="form-group">
                    <label>Nombre Producto</label> <input type="text" value="<c:out value='${Producto.descripcionProd}'/>" 
                    class="form-control" name="descripcionProd">
                </fieldset>
                
                <fieldset class="form-group">
                    <label>Precio Producto</label> <input type="text" value="<c:out value='${Producto.precioProd}'/>" 
                    class="form-control" name="precioProd">
                </fieldset>
                
                <fieldset class="form-group">
                    <label>Categoria</label> <input type="text" value="<c:out value='${Categoria.descripcionCat}'/>" 
                    class="form-control" name="descripcionCat" readonly onmousedown="return false;">
                </fieldset>
                    
                <fieldset class="form-group">
                    <label>Nueva Categoria</label><br>
                    <select name="listacategorias" id="listacategorias" class="form-control">                       
                        <c:forEach var="categoria1" items="${listCategorias}">
                            <option value="<c:out value='${categoria1.idCat}'/>" ><c:out value='${categoria1.descripcionCat}'/> </option>
                        </c:forEach>
                    </select>  
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
