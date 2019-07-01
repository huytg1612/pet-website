<%-- 
    Document   : service
    Created on : Jun 30, 2019, 11:58:08 AM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="fontFamily.css"/>
        <link rel="stylesheet" type="text/css" href="css/NavBar.css"/>
        <link rel="stylesheet" type="text/css" href="css/service.css"/>
        <link rel="stylesheet" type="text/css" href="css/SnackBar.css"/>

        <title>JSP Page</title>
    </head>
    <body onload="showNotice()">
        <%@include file="../Components/NavBar.jsp" %>

        <div style="float:left;padding: 2% 12%;">
            <div id="container-service">
                <c:forEach var="dtoService" items="${requestScope.LIST_Service}">
                    <h4 style="text-align: center;">${dtoService.name}</h4>
                    <div class="service">
                        <img src="<%= request.getContextPath()%>${dtoService.image}" class="service-image">
                        <form action="ServiceMainController" method="POST">
                            <button type="submit" class="btn btn-info button-on-middle" name="action" value="Search">More details</button>    
                            <input type="hidden" name="txtServiceID" value="${dtoService.id}"/>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div id="snackbar"></div>
        <script type="text/javascript" src="js/SnackBar.js"></script>
        <script type="text/javascript">
        function  showNotice() {
            if (<%= request.getAttribute("NOTICE") != null%>) {
                showSnackBar('${requestScope.NOTICE}');
            }
        }
        </script>
    </body>
</html>
