<%-- 
    Document   : login
    Created on : 24 jul. 2022, 20:29:51
    Author     : JUAN CARVAJAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- BOOTSTRAP 4 -->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            html,body{
                margin: 0;
                padding: 0;
            }
            .main{
                background-image: url(https://images8.alphacoders.com/718/718915.jpg);
                width: 100vw;
                height: 100vh;
            }
        </style>
    </head>    
    <body>
        <div class="main">
            <br></br>
            <div class="container col-md-4">
                <div class="card"  style="background-color: #78D0FF">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/validar" style="text-align: center">
                            <div class="form-group text-center">
                                <h2>Bienvenido a Supermercado NALA</h2>
                            </div>
                            <div class="form-group">                    
                                <div class="form-group">
                                    <label>Usuario</label>
                                    <input class="form-control" type="text" name="user" placeholder="Ingrese su Usuario" required autofocus>
                                </div><br>
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input class="form-control" type="password" name="password" placeholder="Ingrese su Contraseña" required autofocus>
                                </div>
                            </div><br>
                            <input class="btn btn-primary" style="width:150px; height:40px" type="submit" name="btnLogin" value="Ingresar">
                            <a href="<%=request.getContextPath()%>/registro" class="btn btn-warning" style="width:150px; height:40px">Nuevo Usuario</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
