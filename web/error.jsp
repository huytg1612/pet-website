<%-- 
    Document   : error
    Created on : Jun 2, 2019, 1:41:25 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String error = (String)request.getAttribute("ERROR");
        %>
        <h1 style="color:red"><%= error %></h1>
        <a href="index.jsp">Go home now?</a>
    </body>
</html>
