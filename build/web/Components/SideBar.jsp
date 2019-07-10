<%-- 
    Document   : SideBar
    Created on : Jun 6, 2019, 4:21:30 PM
    Author     : SE130226
--%>
<%@page import="huytg.dtos.RegistrationDetailDTO"%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

        .list-links-style{
            width: 100%;
            padding: 0 8%;
        }
    </style>

    <%
        RegistrationDetailDTO user = (RegistrationDetailDTO) session.getAttribute("USER");
        if (user == null) {
            request.setAttribute("ERROR", "Session time out");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    %>

    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
        <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
        <span class="w3-bar-item w3-right">Petland</span>
    </div>

    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong><%= user.getFirstName() + " " + user.getLastName()%></strong></span><br>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
        </div>
    </div>
    <hr>
    <div class="w3-container">
        <h5>Dashboard</h5>
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  Overview</a>
        <a href="AdminForwardController?page=adminRegister.jsp" class="w3-bar-item w3-button w3-padding">Add a new admin</a>
        <a href="AdminMainController?action=Edit" class="w3-bar-item w3-button w3-padding">Profile</a>
        <a href="AdminForwardController?page=adminChangePassword.jsp" class="w3-bar-item w3-button w3-padding">Change password</a>
        <a href="AdminForwardController?page=adminCustomer.jsp" class="w3-bar-item w3-button w3-padding">Customer</a>
        <p class="w3-bar-item w3-button w3-padding" style="margin: 0" onclick="myFunction('accessory-list-links')">Accessory</p>
        <div id="accessory-list-links" class="list-links-style" style="display: none">
            <a href="AdminForwardController?page=adminAccessory.jsp" class="w3-bar-item w3-button w3-padding">View Accessory</a>
            <a href="AdminForwardController?page=adminInsertAccessory.jsp" class="w3-bar-item w3-button w3-padding">Insert Accessory</a>
        </div>

        <a href="AdminForwardController?page=adminSchedule.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i>  View Schedule</a>
        <form action="AdminMainController" method="POST">
            <button type="submit" name="action" value="Logout" class="btn btn-outline-danger">Log out</button>
        </form>
    </div>

    <script type="text/javascript" src="js/SideBar.js"></script>
</nav>
