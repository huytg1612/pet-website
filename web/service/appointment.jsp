<%-- 
    Document   : appointment
    Created on : Jun 30, 2019, 1:32:23 PM
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

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ----------> 

        <link rel="stylesheet" type="text/css" href="fontFamily.css"/>
        <link rel="stylesheet" type="text/css" href="css/NavBar.css"/>
        <link rel="stylesheet" type="text/css" href="css/appointment.css"/>

        <title>JSP Page</title>
    </head>
    <body onload="setRequiredLogin()">
        <%@include file="../Components/NavBar.jsp" %>

        <c:set var="dtoService" value="${requestScope.DTO_Service}"/>

        <div class="container appoinment-container">
            <div class="row">
                <img src="<%= request.getContextPath()%>${dtoService.image}" class="appoinment-image"/>
                <div class="appoinment-beside-image"></div>
                <div class="appoinment-detail">
                    <h4>Details</h4>
                    <p>${dtoService.descrip}</p>
                </div>
                <div class="col-md-6" id="form-appointment">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Book an Appointment</h2>
                        </div>
                        <form action="ServiceMainController" method="POST">
                            <!-- Form start -->
                            <input type="hidden" name="txtServiceID" value="${dtoService.id}"/>
                            <div class="row">
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Preferred Date</label>
                                        <select class="form-control input-md" id="date-picker" onchange="setTimePicker()" name="cboDate">
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time" >Preferred Time</label>
                                        <select id="time" class="form-control" name="cboTime">
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="appointmentfor">Appointment For</label>
                                        <select id="appointmentfor" class="form-control" name="cboPetID">
                                            <c:forEach var="dtoPet" items="${requestScope.DTO_Pet}">
                                                <option value="${dtoPet.id}">${dtoPet.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" >Price</label>
                                        <h3>${dtoService.price}</h3>
                                        <input type="hidden" name="txtTotal" value="${dtoService.price}"/>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button id="singlebutton" name="action" value="CheckOut" class="btn btn-default">Make An Appointment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- form end -->
                    </div>

                    <div id="required-login-div">
                        <h3>You must login to make an appointment</h3>
                        <a href="login.jsp">Go to login now?</a>
                    </div>                
                </div>
                <div class="col-md-6">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Why Appointment with Us</h2>
                        </div>
                        <div class="feature-block">
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">24/7 Hours Available</h4>
                                <div class="feature-content">
                                    <p>Integer nec nisi sed mi hendrerit mattis. Vestibulum mi nunc, ultricies quis vehicula et, iaculis in magnestibulum.</p>
                                </div>
                            </div>
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">Experienced Staff Available</h4>
                                <div class="feature-content">
                                    <p>Aliquam sit amet mi eu libero fermentum bibendum pulvinar a turpis. Vestibulum quis feugiat risus. </p>
                                </div>
                            </div>
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">Low Price & Fees</h4>
                                <div class="feature-content">
                                    <p>Praesent eu sollicitudin nunc. Cras malesuada vel nisi consequat pretium. Integer auctor elementum nulla suscipit in.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function setRequiredLogin() {
                var requiredLogin = document.getElementById('required-login-div');

                if (<%= session.getAttribute("USER") == null %>) {
                    $("#form-appointment *").attr("disabled", "disabled").off('click');
                    requiredLogin.style.display = 'block';
                } else {
                    $("#form-appointment *").attr("enabled", "enabled").on('click');
                    requiredLogin.style.display = 'none';
                }

                setDayPicker();
            }
        </script>
        <script type="text/javascript" src="js/appointment.js"></script>
    </body>
</html>
