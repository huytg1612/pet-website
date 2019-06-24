<%-- 
    Document   : NavBar
    Created on : Jun 2, 2019, 10:56:52 AM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="huytg.dtos.RegistrationDetailDTO"%>
<%@page import="huytg.dtos.RegistrationDTO"%>
<%
    RegistrationDetailDTO dto = (RegistrationDetailDTO) session.getAttribute("USER");
%>

<c:url value="AccessoryMainController" var="url_Accessory">
    <c:param name="action" value="Load"/>
    <c:param name="txtAccessorySearch" value="" />
    <c:param name="page" value="1"/>
</c:url>

<c:url value="MainController" var="url_Invoice">
    <c:param name="action" value="ViewInvoice"/>
</c:url>

<div id="nav-bar-container">
    <h1 id="nav-bar-brand">Petland</h1>
    <div id="nav-bar-links">
        <a href="index.jsp" class="nav-bar-link">Home</a>
        <a href="#" class="nav-bar-link">News</a>
        <a href="#" class="nav-bar-link">About</a>
        <a href="<c:out value="${url_Accessory}" />" class="nav-bar-link">Accessory</a>
        <a href="#" class="nav-bar-link">Service</a>
        <%
            if (dto != null) {
        %><div class="dropdown show" style="float: right;margin-right: 10%">
            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#777777;">
                Hello,<strong><%= dto.getFirstName() + " " + dto.getLastName()%></strong>
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="MainController?action=Edit&txtUsername=<%= dto.getUsername()%>">Profile</a>
                <a class="dropdown-item" href="${url_Invoice}">Your invoice</a>
                <a class="dropdown-item" href="../user/user_petmanage/PetMainController?action=Load">Your pet</a>
                <hr/>
                <a class="dropdown-item" href="MainController?action=Logout">Log out</a>
            </div>
        </div><%
        %><i class="far fa-user-circle"></i><%                        } else {
        %><a href="login.jsp" class="nav-bar-link">Login</a><%
            }
            %>
    </div>
</div>
