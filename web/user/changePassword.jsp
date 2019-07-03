<%-- 
    Document   : changePassword
    Created on : Jun 26, 2019, 6:31:07 PM
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

        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="css/UserSideBar.css">
        <link rel="stylesheet" type="text/css" href="css/user_page.css">
        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/SnackBar.css">

        <title>JSP Page</title>
        <style>
            .invalid{
                color: red;
            }
        </style>
    </head>
    <body onload="showNotice()" style="" id="body-style">
        <%
            RegistrationDetailDTO dtoSession = (RegistrationDetailDTO) session.getAttribute("USER");
            if (dtoSession == null) {
                request.setAttribute("ERROR", "Session time out");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        %>
        <%@include file="../Components/NavBar.jsp" %>

        <div style="" id="container-page">
            <%@include file="../Components/UserSideBar.jsp" %>

            <form action="MainController" method="POST" style="" id="component-right">
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
                <button type="submit" name="action" value="changePassword" class="btn btn-primary">Change password</button>
            </form>            
        </div>
        <div id="snackbar"></div>
    </body>
    <script type="text/javascript" src="js/SnackBar.js"></script>
    <script type="text/javascript">
        function showNotice() {
            if (<%= request.getAttribute("NOTICE") != null%>) {
                showSnackBar('${requestScope.NOTICE}');
            }
        }
    </script>
</body>
</html>
