<%-- 
    Document   : adminRegister
    Created on : Jul 4, 2019, 4:11:03 PM
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

        <link rel="stylesheet" href="css/SnackBar.css">

        <title>JSP Page</title>
        <style>
            .invalid{
                color: red;
            }
        </style>
    </head>
    <body class="w3-light-grey" onload="onLoad()">
        <%@include file="../Components/SideBar.jsp" %>

        <!-- Overlay effect when opening sidebar on small screens -->

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div style="padding: 2% 20%;">
                <h2 id="title">Register</h2>
                <form action="AdminMainController" method="POST">
                    <div class="form-row">
                        <div class="col-md-6 mb-3">                
                            FirstName <input type="text" class="form-control" name="txtFirstName" value="${param.txtFirstName}"/>
                            <p class="invalid">${requestScope.INVALID_Regis.fName}</p>
                        </div>
                        <div class="col-md-6 mb-3">
                            LastName <input type="text" class="form-control" name="txtLastName" value="${param.txtLastName}"/>
                            <p class="invalid">${requestScope.INVALID_Regis.lName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        Username <input type="text" class="form-control" name="txtUsername" value="${param.txtUsername}"/>
                        <p class="invalid">${requestScope.INVALID_Regis.username}</p>
                    </div>
                    <div class="form-group">
                        Password <input type="password" class="form-control" name="txtPassword" id="txtPassword" onchange="onChange()"/>
                        <p class="invalid">${requestScope.INVALID_Regis.password}</p>
                    </div>
                    <div class="form-group">
                        Confirm password <input type="password" class="form-control" name="txtConfirmPassword" id="txtConfirm" onchange="onChange()"/>
                        <p class="invalid">${requestScope.INVALID_Regis.confirm}</p>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">                
                            <button type="submit" name="action" value="Register" id="btnSubmit" class="btn btn-success btn_submit">Register</button>
                        </div>
                        <div class="col-md-6 mb-3">
                            <button type="reset" name="reset" value="Reset" class="btn btn-light btn_submit">Reset</button>
                        </div>
                    </div>
                </form> 
            </div>
        </div>
        <div id="snackbar"></div>
        <script type="text/javascript" src="js/SnackBar.js" ></script>
        <script type="text/javascript">
                            function onLoad() {
                                if (${requestScope.NOTICE != null}) {
                                    showSnackBar('${requestScope.NOTICE}');
                                }
                            }
        </script>
    </body>
</html>
