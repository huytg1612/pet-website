<%-- 
    Document   : index
    Created on : Jun 2, 2019, 10:49:06 AM
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
        <link rel="stylesheet" type="text/css" href="css/SnackBar.css"/>
        <link rel="stylesheet" type="text/css" href="css/index.css"/>
        <link rel="stylesheet" type="text/css" href="css/Footer.css"/>

        <title>JSP Page</title>
    </head>
    <body onload="showNotice()">
        <%@include file="Components/NavBar.jsp" %>
        <div style="width: 100%;height: auto;float: left">
            <%@include file="Components/Carousel.jsp" %>
        </div>
        <div id="body-container">
            <div class="nav-title">
                <h3>Top 10 - Sales</h3>
            </div>
            <div class="sub-container">
                <c:set var="list" value="${requestScope.LIST_Accessory}"/>
                <c:if test="${not empty list}">
                    <c:forEach var="dtoAccess" items="${list}" varStatus="theCount">
                        <div class="card top-accessory">
                            <img class="card-img-top" src="<%= request.getContextPath()%>${dtoAccess.image}" alt="Card image cap" height="200px">
                            <div class="card-body">
                                <p class="card-title">${dtoAccess.name}</p>
                                <h5 class="card-text">${dtoAccess.price}</h5>
                                <a href="AccessoryMainController?action=Search&txtAccessorySearch=${dtoAccess.id}" target="_blank" class="btn btn-primary">Details</a>
                                <button class="btn btn-danger" name="action" value="Add to Cart" onclick="loadDoc('${dtoAccess.id}')" 
                                        <c:if test="${dtoAccess.quantity <= 0}" > disabled="" </c:if>>Add to Cart</button>
                                </div>
                            </div>                        
                    </c:forEach>
                </c:if>
                <c:if test="${empty list}">
                    <h1 style="text-align: center">No result</h1>
                </c:if>
            </div>
            <div class="nav-title" style="background-color: #007db4">
                <h3>Services</h3>
                <c:set var="listSer" value="${requestScope.LIST_Service}"/>
                <c:forEach var="dtoService" items="${listSer}">
                    <a href="ServiceSearchController?txtServiceID=${dtoService.id}" class="link-service">${dtoService.name}</a>
                </c:forEach>
            </div>
            <div id="sub-container-left">
                <div class="service-info">
                    <img src="images/Icons/icon1.jpg"/>
                    <p>PETSMART BREED DAYS</p>
                    <h5>Download for FREE today</h5>
                    <p>Book services, get special offers, play our Treat Trail Game & more right at your fingertips.</p>
                </div>
                <div class="service-info">
                    <img src="images/Icons/icon2.jpg"/>
                    <p>ADOPTION</p>
                    <h5>PetSmart Charities®</h5>
                    <p>Find a new best friend & adopt a pet near you.</p>
                </div>
                <div class="service-info">
                    <img src="images/Icons/icon3.jpg"/>
                    <p>PETSMART BREED DAYS</p>
                    <h5>10% off for Pomeranians & Russells</h5>
                    <p>Bring your Pomeranian, Jack Russell or Parson Russell to the salon for 10% off plus shop essentials just for them</p>
                </div>
                <div class="service-info">
                    <img src="images/Icons/icon4.jpg"/>
                    <p>PETSMART PARTIES</p>
                    <h5>Sample Saturdays</h5>
                    <p>Join us on 8/3 from 12-2pm for FREE dog & cat food samples that help support healthy skin & shiny coats!</p>
                </div>
            </div>
            <div id="sub-container-right">
                <img src="images/Meet_Pets_We_Groomed_with_Love.jpg"/>
            </div>
        </div>
        <div class="nav-title" style="background-color: #f2f7fc">
            <h3 id="third-nav-title">your puppy place</h3>
            <p>New puppy? Find everything you need for your newest family member.</p>
        </div>
    </div>
    <%@include file="Components/Footer.jsp" %>
    <div id="snackbar"></div>
    <script type="text/javascript" src="js/SnackBar.js"></script>
    <script>
                                    function  showNotice() {
                                        if (<%= request.getAttribute("NOTICE") != null%>) {
                                            showSnackBar('${requestScope.NOTICE}');
                                        }
                                    }

                                    function loadDoc(id) {

                                        var xhttp = new XMLHttpRequest();
                                        xhttp.onreadystatechange = function () {
                                            if (this.readyState === 4 && this.status === 200) {

                                                document.getElementById("cart-size").innerHTML = this.responseText;
                                                showSnackBar('Add to cart successful');
                                            }
                                        };
                                        xhttp.open("POST", "CartMainController", true);
                                        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        xhttp.send("action=Insert&txtAccessoryID=" + id);
                                    }
    </script>
</body>
</html>
