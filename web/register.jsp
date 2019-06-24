<%-- 
    Document   : register
    Created on : Jun 2, 2019, 12:32:48 PM
    Author     : SE130226
--%>

<%@page import="huytg.dtos.RegistrationDTO"%>
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
        <link rel="stylesheet" type="text/css" href="css/register.css">
        <title>JSP Page</title>

    </head>
    <body onload="myFunction()">
        <div id="left-container">
            <h2 id="title">Register</h2>
            <form action="MainController" method="POST">
                <div class="form-row">
                    <div class="col-md-6 mb-3">                
                        FirstName <input type="text" class="form-control" name="txtFirstName" value="${param.txtFirstName}" required/>
                        <p class="invalid">${requestScope.INVALID_Regis.fName}</p>
                    </div>
                    <div class="col-md-6 mb-3">
                        LastName <input type="text" class="form-control" name="txtLastName" value="${param.txtLastName}" required/>
                        <p class="invalid">${requestScope.INVALID_Regis.lName}</p>
                    </div>
                </div>
                <div class="form-group">
                    Username <input type="text" class="form-control" name="txtUsername" value="${param.txtUsername}" required/>
                    <p class="invalid">${requestScope.INVALID_Regis.username}</p>
                </div>
                <div class="form-group">
                    Password <input type="password" class="form-control" name="txtPassword" id="txtPassword" onchange="onChange()" required=/>
                    <p class="invalid">${requestScope.INVALID_Regis.password}</p>
                </div>
                <div class="form-group">
                    Confirm password <input type="password" class="form-control" name="txtConfirmPassword" id="txtConfirm" onchange="onChange()" required=/>
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
        <div id="right-container">
            <img src="images/wallpaper-dog-regis.jpg" id="right-container-img">
        </div>

    </body>

    <script type="text/javascript">
        function myFunction(){
          /*window.location.href = "http://localhost:8080/PetLand/register.jsp";*/
        }
/*        function onChange() {
            var pass = document.getElementById("txtPassword").value;
            var confirm = document.getElementById("txtConfirm").value;
            var btn = document.getElementById("btnSubmit");
            var notice = document.getElementById("notice");

            if (pass === confirm) {
                btn.disabled = false;
                notice.innerHTML = "";
            } else {
                btn.disabled = true;
                notice.innerHTML = "Your password is not match";
            }
        }*/
    </script>
</html>
