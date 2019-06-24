<%-- 
    Document   : login
    Created on : Jun 2, 2019, 10:51:37 AM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="left-container">
            <img src="images/wallpaper-cat.jpg" id="left-container-img">
        </div>
        <div id="right-container">
            <h2 id="title">Login</h2>
            <form action="MainController" method="POST">
                <div class="form-group">
                    <label for="exampleInputText1">Username</label>
                    <input type="text" class="form-control" id="exampleInputText" name="txtUsername">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="txtPassword">
                </div>
                <p style="color: red">${requestScope.INVALID_Regis.login}</p>
                <button type="submit" name="action" value="Login" class="btn btn-success btn_submit">Login</button>
            </form>
            <div id="register-link">
                <a href="register.jsp" >Register?</a>
            </div>
        </div>
    </body>
</html>
