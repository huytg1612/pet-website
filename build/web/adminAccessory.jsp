<%-- 
    Document   : adminAccessory
    Created on : Jun 6, 2019, 4:28:33 PM
    Author     : SE130226
--%>

<%@page import="huytg.dtos.AccessoryDTO"%>
<%@page import="java.util.List"%>
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

        <title>JSP Page</title>
    </head>
    <body class="w3-light-grey">
        <%@include file="Components/SideBar.jsp" %>

        <%            
            List<AccessoryDTO> list = (List) request.getAttribute("List_Accessory");
            if (list != null) {
                System.out.println(list.size());
            }
        %>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>   
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="form-inline my-2 my-lg-0" action="AdminMainController" method="POST">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                               name="txtAccessorySearch">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="Search">Search</button>
                    </form>
                </div>
            </nav>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">UseFor</th>
                            <th scope="col">Price</th>
                            <th scope="col">Type</th>
                            <th scope="col">Status</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dtoAccess" items="<%= list%>">
                            <tr>
                                <th scope="row">${dtoAccess.getId()}</th>
                                <td>${dtoAccess.getName()}</td>
                                <td>${dtoAccess.getUseFor()}</td>
                                <td>${dtoAccess.getPrice()}</td>
                                <td>${dtoAccess.getType()}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${dtoAccess.getStatus() == 0}">
                                            Show
                                        </c:when>
                                        <c:when test="${dtoAccess.getStatus() == 1}">
                                            Hidden
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <form action="AdminMainController" method="POST">
                                        <input type="hidden" name="txtAccessoryID" value="${dtoAccess.getId()}"/>
                                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="action" value="Edit">Edit</button>
                                    </form>
                                </td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
