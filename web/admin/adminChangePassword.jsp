<%-- 
    Document   : adminChangePassword
    Created on : Jul 3, 2019, 10:55:09 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <body class="w3-light-grey">
        <%@include file="../Components/SideBar.jsp" %>

        <!-- Overlay effect when opening sidebar on small screens -->

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="form-container" style="padding: 2% 20%;">
                <form action="AdminMainController" method="POST"  style="background-color: white;padding: 2%">
                    <h2>Change password</h2>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Old password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Old password"
                               name="txtOldPassword">
                        <p class="invalid">${requestScope.INVALID.oldPassword}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword2">New password</label>
                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="New password"
                               name="txtNewPassword">
                        <p class="invalid">${requestScope.INVALID.password}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword3">Confirm password</label>
                        <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Confirm"
                               name="txtConfirm">
                        <p class="invalid">${requestScope.INVALID.confirm}</p>
                    </div>
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="action" value="changePassword">Change password</button>
                </form>
            </div>
        </div>
    </body>
</html>