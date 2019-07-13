<%-- 
    Document   : adminProfile
    Created on : Jul 4, 2019, 11:30:52 AM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <style>
            .invalid{
                color:red;
            }
        </style>

        <title>JSP Page</title>
    </head>
    <body onload="onLoad()">
        <%@include file="../Components/SideBar.jsp" %>

        <!-- Overlay effect when opening sidebar on small screens -->

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <c:set var="dtoReDe" value="${requestScope.DTO_ReDe}" />
            <div style="padding: 2% 20%;">
                <form action="AdminMainController" method="POST" style="" id="component-right">
                    <div class="form-group">
                        <label for="validationDefault01">Username: </label>
                        <input type="text" class="form-control" id="validationDefault01" name="txtUsername" readonly
                               value="${dtoReDe.username}">
                    </div>
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationDefault01">First name</label>
                            <input type="text" class="form-control" id="validationDefault01" placeholder="First name" name="txtFirstName" 
                                   value="${dtoReDe.firstName}">
                            <p class="invalid">${requestScope.INVALID.fName}</p>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationDefault02">Last name</label>
                            <input type="text" class="form-control" id="validationDefault02" placeholder="Last name" name="txtLastName" 
                                   value="${dtoReDe.lastName}">
                            <p class="invalid">${requestScope.INVALID.lName}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Sex</label>
                        <select class="form-control" id="exampleFormControlSelect1" name="cboSex">
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        Date of birth:<input type="date" class="form-control" id="validationDefault02" name="txtDOB"
                                             value="${dtoReDe.dob}">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputText">Address:</label>
                        <input type="text" class="form-control" id="exampleInputText" name="txtAddress"
                               value="${dtoReDe.address}">
                    </div>
                    <div class="form-group">
                        Phone:<input type="tel" class="form-control" id="validationDefault02" 
                                     pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="txtPhone" value="${dtoReDe.phone}">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">About</label>
                        <textarea class="form-control" name="txtAbout" id="exampleFormControlTextarea1" rows="3" value="${dtoReDe.about}" >${dtoReDe.about}</textarea>
                    </div>
                    <button type="submit" name="action" value="Update" class="btn btn-primary">Update</button>
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
