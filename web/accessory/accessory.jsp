<%-- 
    Document   : accessory
    Created on : Jun 8, 2019, 3:47:32 PM
    Author     : SE130226
--%>

<%@page import="huytg.dtos.ShoppingCart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="huytg.dtos.AccessoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="css/accessory.css">
        <link rel="stylesheet" type="text/css" href="css/SnackBar.css">
        <link rel="stylesheet" type="text/css" href="css/Footer.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<AccessoryDTO> listAccess = (List) request.getAttribute("LIST_Accessory");

            int panigation = (int) Math.ceil(listAccess.size() / 8);
        %>

        <%@include file="../Components/NavBar.jsp" %>        

        <c:set var="forwardRequest" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        <c:set var="queryString" value="${ pageContext.request.queryString }"/>

        <c:set var="list" value="${requestScope.LIST_Accessory}"/>

        <c:url value="AccessoryMainController" var="url_All_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="All"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Collar_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="Collar"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Clothes_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="Clothes"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Toys_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="Toys"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Feeding_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="Feeding"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Bedding_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value="Bedding"/>
            <c:param name="page" value="1"/>
        </c:url>
        <c:url value="AccessoryMainController" var="url_Detail_Access">
            <c:param name="action" value="SearchType"/>
            <c:param name="txtAccessorySearch" value=""/>
            <c:param name="page" value="1"/>
        </c:url>

        <div id="container-left">
            <div class="container-li-links">
                <p>Type</p>
                <ul>
                    <li><a href="<c:out value='${url_All_Access}' />">All</a></li>
                    <li><a href="<c:out value='${url_Collar_Access}' />">Collar</a></li>
                    <li><a href="<c:out value='${url_Clothes_Access}' />">Clothes</a></li>
                    <li><a href="<c:out value='${url_Toys_Access}' />">Toys</a></li>
                    <li><a href="<c:out value='${url_Feeding_Access}' />">Feeding</a></li>
                    <li><a href="<c:out value='${url_Bedding_Access}' />">Bedding</a></li>
                </ul>
            </div>
        </div>
        <div id="container-right">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="txtAccessorySearch">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="Load">Search</button>
                </form>
            </nav>

            <c:if test="${not empty list}">
                <c:forEach var="dtoAccess" items="${list}" varStatus="theCount">
                    <div class="card accessory">
                        <img class="card-img-top" src="<%= request.getContextPath()%>${dtoAccess.image}" alt="Card image cap" height="200px">
                        <div class="card-body">
                            <p class="card-title">${dtoAccess.name}</p>
                            <h5 class="card-text">${dtoAccess.price}</h5>
                            <a href="AccessoryMainController?action=Search&txtAccessorySearch=${dtoAccess.id}" target="_blank" class="btn btn-primary">Details</a>
                            <button class="btn btn-danger" name="action" value="Add to Cart" onclick="loadDoc('${dtoAccess.id}')">Add to Cart</button>
                        </div>
                    </div>                        
                </c:forEach>
            </c:if>
            <c:if test="${empty list}">
                <h1 style="text-align: center">No result</h1>
            </c:if>
        </div>

        <nav aria-label="Page navigation example">
            <ul class="pagination" style="float:left;margin-left:20.8%;">
                <c:url var="urlPrev" value="AccessoryMainController">
                    <c:param name="action" value="${param.action}"/>
                    <c:param name="txtAccessorySearch" value="${param.txtAccessorySearch}"/>
                    <c:param name="page" value="${param.page - 1}"/>
                </c:url>
                <li class="page-item" id="page-item-prev"><a class="page-link" href="${urlPrev}">Previous</a></li>
                    <c:forEach begin="0" end="<%= panigation%>" varStatus="theCount">
                        <c:url var="urlPagination" value="AccessoryMainController">
                            <c:param name="action" value="${param.action}"/>
                            <c:param name="txtAccessorySearch" value="${param.txtAccessorySearch}"/>
                            <c:param name="page" value="${theCount.count}"/>
                        </c:url>
                    <li class="page-item page-item-number"><a class="page-link" href="${urlPagination}">
                            ${theCount.count}<span class="sr-only">(current)</span></a></li>
                        </c:forEach>
                        <c:url var="urlNext" value="AccessoryMainController">
                            <c:param name="action" value="${param.action}"/>
                            <c:param name="txtAccessorySearch" value="${param.txtAccessorySearch}"/>
                            <c:param name="page" value="${param.page + 1}"/>
                        </c:url>
                <li class="page-item" id="page-item-next"><a class="page-link" href="${urlNext}">Next</a></li>
            </ul>
        </nav>
        <%@include file="../Components/Footer.jsp" %>
        <div id="snackbar"></div>
        <script type="text/javascript" src="js/accessory.js"></script>
        <script type="text/javascript" src="js/SnackBar.js"></script>
    </body>
</html>
