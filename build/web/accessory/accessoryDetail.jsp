<%-- 
    Document   : accessoryDetail
    Created on : Jun 10, 2019, 9:59:19 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="css/accessoryDetail.css">
        <link rel="stylesheet" type="text/css" href="css/Footer.css">

    </head>
    <body>
        <%@include file="../Components/NavBar.jsp" %>

        <c:set var="dtoAccess" value="${requestScope.DTO_Accessory}" />

        <c:if test="${not empty dtoAccess}">
            <div id="accessory-detail-container">
                <div id="left-container">
                    <div id="accessory-image">
                        <img src="<%= request.getContextPath() %>${dtoAccess.image}" width="100%" height="100%"/>
                    </div>
                </div>
                <div id="right-container">
                    <div id="accessory-detail">
                        <h3>${dtoAccess.getName()}</h3>
                        <h3>${dtoAccess.getPrice()} USD</h3>
                        <p>Quantity</p>
                        <input type="number" name="quantity" max="${dtoAccess.getQuantity()}" min="1" value="1"/>
                        <form>
                            <button type="button" class="btn btn-outline-dark btn_style">Buy it now</button>
                            <button type="button" class="btn btn-dark btn_style">Add to cart</button>
                        </form>
                        <hr/>
                        <h3>Item details</h3>
                        <p>Made in: ${dtoAccess.getMadeIn()}</p>
                        <p>Use for: ${dtoAccess.getUseFor()}</p>
                        <h3>Description</h3>
                        <p>${dtoAcces.getDescription()}</p>
                    </div>
                </div>
            </div>            
        </c:if>
        <c:if test="${empty dtoAccess}">
            <h1 style="text-align: center">Not found accessory</h1>
        </c:if>

            <%@include file="../Components/Footer.jsp" %>   
    </body>
</html>
