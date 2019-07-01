<%-- 
    Document   : schedule
    Created on : Jul 1, 2019, 3:26:19 PM
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

        <title>JSP Page</title>
    </head>
    <body id="body-style">
        <%@include file="../Components/NavBar.jsp" %>

        <div id="container-page">
            <%@include file="../Components/UserSideBar.jsp" %>

            <div id="component-right">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Service</th>
                            <th scope="col">For Pet</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Total</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dtoSchedule" items="${requestScope.LIST_Schedule}" varStatus="theCount">
                            <tr>
                                <th scope="row">${theCount.count}</th>
                                <td>${dtoSchedule.serviceName}</td>
                                <td>${dtoSchedule.petName}</td>
                                <td>${dtoSchedule.date}</td>
                                <td>${dtoSchedule.time}</td>
                                <td>${dtoSchedule.total}</td>
                                <td>
                                    <c:if test="${dtoSchedule.status == 0}">
                                        <span class="badge badge-primary">Waiting</span>
                                    </c:if>
                                    <c:if test="${dtoSchedule.status == 1}">
                                        <span class="badge badge-success">Done</span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
