<%-- 
    Document   : error
    Created on : 28 jul. 2022, 23:40:17
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
                        <form action="<%=request.getContextPath()%>/login" style="text-align: center">
                            <i class='fas fa-exclamation-triangle' style='font-size:48px;color:red'></i>
                            <div class="form-group text-center">
                                <h2>ERROR DE INICIO DE SESSION</h2>
                            </div>
                            <div class="form-group">                    
                                <h6>Debes iniciar session para poder ingresar</h6>
                            </div><br>
                            <input class="btn btn-primary" style="width:150px; height:40px" type="submit" name="btnLogin" value="Volver">
                            <a href="<%=request.getContextPath()%>/registro" class="btn btn-warning" style="width:150px; height:40px">Registrar</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <script src="https://kit.fontawesome.com/e5c5dcc354.js" crossorigin="anonymous"></script>
    </body>
</html>
