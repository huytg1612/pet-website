<%-- 
    Document   : profile
    Created on : Jun 2, 2019, 8:47:29 PM
    Author     : SE130226
--%>

<%@page import="huytg.dtos.RegistrationDetailDTO"%>
<%@page import="huytg.dtos.RegistrationDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <title>JSP Page</title>
    </head>
    <%
        String notice = (String) request.getAttribute("NOTICE");
    %>
    <body onload="onLoad()">
        <%
            RegistrationDetailDTO dtoSession = (RegistrationDetailDTO) session.getAttribute("USER");
            if (dtoSession == null) {
                request.setAttribute("ERROR", "Session time out");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        %>
        <%@include file="../Components/NavBar.jsp" %>
        <%            RegistrationDetailDTO dtoReDe = (RegistrationDetailDTO) request.getAttribute("DTO_ReDe");
            if (dtoReDe == null) {
                dtoReDe = new RegistrationDetailDTO();
            } else {
                if (dtoReDe.getFirstName() == null) {
                    dtoReDe.setFirstName("");
                }
                if (dtoReDe.getLastName() == null) {
                    dtoReDe.setLastName("");
                }
                if (dtoReDe.getAbout() == null) {
                    dtoReDe.setAbout("");
                }
                if (dtoReDe.getAddress() == null) {
                    dtoReDe.setAddress("");
                }
                if (dtoReDe.getDob() == null) {
                    dtoReDe.setDob("1/1/2019");
                }
                if (dtoReDe.getPhone() == null) {
                    dtoReDe.setPhone("");
                }
                if (dtoReDe.getSex() == null) {
                    dtoReDe.setSex("");
                }
            }
        %>
        <form action="MainController" method="POST">
            <div class="form-group">
                <label for="validationDefault01">Username: </label>
                <input type="text" class="form-control" id="validationDefault01" name="txtUsername" readonly
                       value="<%= dtoReDe.getUsername()%>">
            </div>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationDefault01">First name</label>
                    <input type="text" class="form-control" id="validationDefault01" placeholder="First name" name="txtFirstName" 
                           value="<%= dtoReDe.getFirstName()%>">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="validationDefault02">Last name</label>
                    <input type="text" class="form-control" id="validationDefault02" placeholder="Last name" name="txtLastName" 
                           value="<%= dtoReDe.getLastName()%>">
                </div>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Sex</label>
                <select class="form-control" id="exampleFormControlSelect1" name="cboSex">
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>
            <div class="form-group">
                Date of birth:<input type="date" class="form-control" id="validationDefault02" name="txtDOB"
                                     value="<%= dtoReDe.getDob()%>">
            </div>
            <div class="form-group">
                <label for="exampleInputText">Address:</label>
                <input type="text" class="form-control" id="exampleInputText" name="txtAddress"
                       value="<%= dtoReDe.getAddress()%>">
            </div>
            <div class="form-group">
                Phone:<input type="tel" class="form-control" id="validationDefault02" 
                             pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="txtPhone" required value="<%= dtoReDe.getPhone()%>">
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">About</label>
                <textarea class="form-control" name="txtAbout" id="exampleFormControlTextarea1" rows="3"><%= dtoReDe.getAbout()%></textarea>
            </div>
            <button type="submit" name="action" value="Update" class="btn btn-primary">Update</button>
        </form>
    </body>
    <script type="text/javascript">
        function onLoad() {
        <%
            if (notice != null) {
                if (!notice.isEmpty()) {
        %>alert("Update successful")<%
                }
            }
        %>
            }
    </script>
</html>
