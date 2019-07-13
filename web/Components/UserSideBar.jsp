<%-- 
    Document   : SideBar
    Created on : Jun 6, 2019, 4:21:30 PM
    Author     : SE130226
--%>
<%@page import="huytg.dtos.RegistrationDetailDTO"%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left user-side-bar" style="z-index:3;width:300px;" id="mySidebar"><br>
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
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <img src="/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
        </div>
        <div class="w3-col s8 w3-bar">
            <span><strong><%= user.getFirstName() + " " + user.getLastName()%></strong></span><br>
        </div>
    </div>
    <hr>
    <div class="w3-container">
        <h5>Dashboard</h5>
    </div>
    <div class="w3-bar-block">
        <a href="MainController?action=Edit" class="w3-bar-item w3-button w3-padding">Profile</a>
        <a href="ForwardController?page=change_password" class="w3-bar-item w3-button w3-padding">Change password</a>
        <p class="w3-bar-item w3-button w3-padding" style="margin: 0" onclick="myFunction('pet-list-links')">Your pet</p>
        <div id="pet-list-links" class="list-links-style" style="display: none">
            <a href="PetMainController?action=Load" class="w3-bar-item w3-button w3-padding">View pet</a>
            <a href="PetMainController?action=Forward" class="w3-bar-item w3-button w3-padding">Create a new pet</a>
        </div>

        <a href="MainController?action=ViewInvoice" class="w3-bar-item w3-button w3-padding">Your invoice</a>
        <a href="ScheduleMainController?action=Load" class="w3-bar-item w3-button w3-padding">Your schedule</a>
    </div>

    <script type="text/javascript" src="js/SideBar.js"></script>
</nav>
