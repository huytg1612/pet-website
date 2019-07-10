<%-- 
    Document   : admin
    Created on : Jun 6, 2019, 3:09:57 PM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="huytg.dtos.RegistrationDetailDTO"%>
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

        <link rel="stylesheet" type="text/css" href="css/admin.css" >
        <link rel="stylesheet" type="text/css" href="css/SnackBar.css" >

        <title>JSP Page</title>

    </head>

    <body class="w3-light-grey" onload="onLoad()">
        <%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("USER")==null)
    response.sendRedirect("login.jsp");

        %> 

        <%@include file="../Components/SideBar.jsp" %>

        <!-- Overlay effect when opening sidebar on small screens -->

        <c:set var="Record" value="${requestScope.RECORD}" />

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">        
            <div class="container-record">
                <h3>Member</h3>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/admin.png" />
                    <h5>${Record.admin}</h5>
                    <p>Admin</p>
                </div>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/customer.png" />
                    <h5>${Record.customer}</h5>
                    <p>Customer</p>
                </div>
            </div>
            <div class="container-record">
                <h3>Revenue</h3>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/dollar.png" />
                    <h5>${Record.revenueLastMonth}$ Total</h5>
                    <p>Last month</p>
                </div>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/yellow-dollar.png" />
                    <h5>${Record.revenueAccessory}$ Accessory</h5>
                    <p>Last month</p>
                </div>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/orange-dollar.png" />
                    <h5>${Record.revenueService}$ Service</h5>
                    <p>Last month</p>
                </div>
            </div>
            <div class="container-record">
                <h3>Tasks</h3>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/calendar.png" />
                    <h5>${Record.schedule}</h5>
                    <p>Today</p>
                    <form action="AdminScheduleMainController" method="POST">
                        <button class="btn btn-outline-primary" name="action" value="Search" type="submit">Check now</button>
                    </form>
                </div>
            </div>
            <div class="container-record">
                <h3>Stock</h3>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/pet.png" />
                    <h5>${Record.pet} Pet</h5>
                    <p>Created</p>
                </div>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/service.png" />
                    <h5>${Record.service} service</h5>
                    <p>Booked</p>
                </div>
                <div class="record">
                    <img src="<%= request.getContextPath()%>/images/Icons/accessory.png" />
                    <h5>${Record.accessory} Accessory</h5>
                    <p>Sold</p>
                </div>
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
