<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="huytg.dtos.RegistrationDetailDTO"%>
<%@page import="huytg.dtos.RegistrationDTO"%>
<%
    RegistrationDetailDTO dto = (RegistrationDetailDTO) session.getAttribute("USER");
%>

<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

%>

<c:url value="AccessoryMainController" var="url_Accessory">
    <c:param name="action" value="Load"/>
    <c:param name="txtAccessorySearch" value="" />
    <c:param name="page" value="1"/>
</c:url>

<c:url value="ServiceMainController" var="url_Service">
    <c:param name="action" value="Load"/>
</c:url>

<c:url value="MainController" var="url_Invoice">
    <c:param name="action" value="ViewInvoice"/>
</c:url>

<div id="nav-bar-container">
    <a href="index.jsp" id="nav-bar-logo"><img src="<%= request.getContextPath()%>/images/logo.jpg" width="160px" height="42px"/></a>
    <div id="nav-bar-links">
        <a href="index.jsp" class="nav-bar-link">Home</a>
        <a href="#" class="nav-bar-link">News</a>
        <a href="#" class="nav-bar-link">About</a>
        <a href="<c:out value="${url_Accessory}" />" class="nav-bar-link">Accessory</a>
        <a href="${url_Service}" class="nav-bar-link">Service</a>
        <%
            if (dto != null) {
        %><div class="dropdown show" style="float: right;margin-right: 10%">
            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:#777777;">
                Hello,<strong><%= dto.getFirstName() + " " + dto.getLastName()%></strong>
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="MainController?action=Edit">Profile</a>
                <hr/>
                <a class="dropdown-item" href="MainController?action=Logout">Log out</a>
            </div>
        </div><%
        %><i class="far fa-user-circle"></i><%                        } else {
        %><a href="login.jsp" class="nav-bar-link">Login</a><%
            }
            %>
        <a href="CartMainController?action=ViewCart" class="badge" id="myCart" style="position: relative;">
            <div id="cart-icon">
                <i class="fa fa-shopping-cart" style="font-size: 25px;color: black;"></i> <span class="badge badge-warning ml-2" id="cart-size" style="position: absolute;left: 40%;height: 13px;width: 13px;padding: 5%;">${sessionScope.CART.size}</span>
            </div>
        </a>
    </div>
</div>
