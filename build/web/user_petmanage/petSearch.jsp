<%-- 
    Document   : petSearch
    Created on : Jun 24, 2019, 6:43:53 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="css/user_page.css">
        <link rel="stylesheet" type="text/css" href="css/petSearch.css">
        <link rel="stylesheet" type="text/css" href="css/UserSideBar.css">

        <title>JSP Page</title>
    </head>
    <body id="body-style">
        <%@include file="../Components/NavBar.jsp" %>
        <div id="container-page">
            <%@include file="../Components/UserSideBar.jsp" %>
            <div id="component-right">
                <h2>Your pet</h2>
                <div id="pet-container">
                    <c:if test="${requestScope.LIST_Pet != null}">
                        <c:if test="${requestScope.LIST_Pet.size() > 0}">
                            <c:set var="list" value="${requestScope.LIST_Pet}"/>
                            <c:forEach var="PetDTO" items="${list}">
                                <div class="card pet-card">
                                    <img class="card-img-top" src="<%= request.getContextPath()%>${PetDTO.image}" alt="Card image cap" style="height: 150px;">
                                    <div class="card-body">
                                        <h5 class="card-title">${PetDTO.name}</h5>
                                        <p class="card-text">${PetDTO.descrip}</p>
                                        <a href="PetMainController?action=Edit&txtPetID=${PetDTO.id}" class="btn btn-primary">Edit</a>
                                        <form action="PetMainController" method="POST">
                                            <button name="action" value="Delete" type="submit" class="btn btn-danger">Delete</button>
                                            <input type="hidden" name="txtPetID" value="${PetDTO.id}"/>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
            </div>

        </div>
    </body>
</html>
