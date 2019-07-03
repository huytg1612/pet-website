<%-- 
    Document   : adminSchedule
    Created on : Jul 1, 2019, 5:02:04 PM
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

        <title>JSP Page</title>
    </head>
    <body class="w3-light-grey"> 
        <%@include file="../Components/SideBar.jsp" %>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>   
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="form-inline my-2 my-lg-0" action="AdminScheduleMainController" method="POST">
                        <input class="form-control mr-sm-2" type="date" name="txtSearch"/>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="Search">Search</button>
                    </form>
                </div>
            </nav>

            <div class="table-container">
                <c:set var="list" value="${requestScope.LIST_Schedule}"/>
                <c:if test="${list != null}">
                    <c:if test="${list.size() > 0}" var="checkList">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Service</th>
                                    <th scope="col">For Pet</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dtoSchedule" items="${list}" varStatus="theCount">
                                    <tr>
                                        <th scope="row">${theCount.count}</th>
                                        <td>${dtoSchedule.serviceName}</td>
                                        <td>${dtoSchedule.petName}</td>
                                        <td>${dtoSchedule.date}</td>
                                        <td>${dtoSchedule.time}</td>
                                        <td>${dtoSchedule.total}</td>
                                        <td>${dtoSchedule.username}</td>
                                        <td>
                                            <c:if test="${dtoSchedule.status == 0}">
                                                <span class="badge badge-primary">Waiting</span>
                                            </c:if>
                                            <c:if test="${dtoSchedule.status == 1}">
                                                <span class="badge badge-success">Done</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <form action="AdminScheduleMainController" method="POST">
                                                <button class="btn btn-outline-danger" type="submit" name="action" value="Update"  <c:if test="${dtoSchedule.status == 1}">disabled</c:if>>
                                                        Set done</button>
                                                    <input type="hidden" name="txtSearch" value="${param['txtSearch']}"/>
                                                <input type="hidden" name="txtScheduleID" value="${dtoSchedule.id}"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${!checkList}">
                        <h2 style="text-align: center">No schedule found</h2>
                    </c:if>
                </c:if>
            </div>
        </div>
    </body>
</html>
