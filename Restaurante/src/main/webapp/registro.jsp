<%-- 
    Document   : registro
    Created on : 28 jul. 2022, 19:13:31
    Author     : JUAN CARVAJAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="css/estilos.css" />
        <title>Registro</title>
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
                        <form action="<%=request.getContextPath()%>/validar2">
                            <div class="form-group text-center">
                                <h2>Registro de Nuevo Usuario</h2>
                            </div>
                            <div class="form-group">                    
                                <div class="form-group">
                                    <label>Usuario</label>
                                    <input class="form-control" type="text" name="usernew" placeholder="Ingrese su Usuario" required autofocus>
                                </div><br>
                                <div class="form-group">
                                    <label>Correo</label>
                                    <input class="form-control" type="text" name="emailnew" placeholder="Ingrese su Correo" required autofocus>
                                </div><br>
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input class="form-control" type="text" name="passwordnew" placeholder="Ingrese su Contraseña" required autofocus>
                                </div>
                            </div><br>
                            <div  style="text-align: center">
                                <input class="btn btn-primary" type="submit" name="btnLogin" value="Registrar">
                                <a href="<%=request.getContextPath()%>/login" class="btn btn-danger">Volver</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>