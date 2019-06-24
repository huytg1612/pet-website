<%-- 
    Document   : adminUpdateAccessory
    Created on : Jun 8, 2019, 10:43:07 AM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Components/SideBar.jsp" %>

    <c:set var="dtoAccess" value="${requestScope.DTO_Accessory}"/>

    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <c:if test = "${not empty dtoAccess}">
            <div class="form-container" style="padding: 2% 20%;">
                <form action="AdminMainController" method="POST"  style="background-color: white;padding: 2%">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">ID</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Accessory ID"
                               name="txtAccessoryId" value="${dtoAccess.getId()}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Name</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Name"
                               name="txtAccessoryName" value="${dtoAccess.getName()}">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Price</label>
                        <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Price"
                               name="txtAccessoryPrice" value="${dtoAccess.getPrice()}" min="0">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Quantity</label>
                        <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Quantity"
                               name="txtAccessoryQuantity" value="${dtoAccess.getQuantity()}" min="0">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Type</label>
                        <select class="form-control" id="cboType" name="cboType">
                            <option>Collar</option>
                            <option>Clothes</option>
                            <option>Toys</option>
                            <option>Feeding</option>
                            <option>Bedding</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Made in</label>
                        <select class="form-control" id="cboMadeIn" name="cboMadeIn">
                            <option>Vietnam</option>
                            <option>China</option>
                            <option>Japan</option>
                            <option>America</option>
                            <option>England</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Use for</label>
                        <select multiple class="form-control" id="cboMultiUseFor" name="cboMultiUseFor" value="${dtoAccess.getUseFor()}">
                            <option>Dog</option>
                            <option>Cat</option>
                            <option>Fish</option>
                            <option>Hamster</option>
                            <option>Bird</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Status</label>
                        <select class="form-control" id="cboStatus" name="cboStatus">
                            <option>Show</option>
                            <option>Hidden</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Description</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="txtAccessoryDescrip" value="${dtoAccess.getDescription()}"></textarea>
                    </div>
                    <br>
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="action" value="Update">Update</button>
                    <input type="hidden" name="txtAccessorySearch" value="${requestScope.txtAccessorySearch}"/>
                </form>
            </div>
        </c:if>
        <c:if test="${empty dtoAccess}">
            <h1 style="text-align: center">Not thing update</h1>
            <a href="adminAccessory.jsp">Search to Update</a>
        </c:if>
    </div>
</body>
<script type="text/javascript">
    window.onload = function () {
        var cboType = document.getElementById("cboType");
        var cboMadeIn = document.getElementById("cboMadeIn");
        var cboStatus = document.getElementById("cboStatus");
        var cboMultiUseFor = document.getElementById("cboMultiUseFor");

        cboType.selectedIndex = "${dtoAccess.getType()-1}";
        cboMadeIn.value = "${dtoAccess.getMadeIn()}";
        cboStatus.selectedIndex = "${dtoAccess.getStatus()}";
        
        var useFor = "${dtoAccess.getUseFor()}";
        var useFors = useFor.split(",");
        
        console.log(1);
        for(var i = 0 ;i < useFors.length;i++){
            for(var j = 0; j < cboMultiUseFor.length;j++){
                if(cboMultiUseFor[j].innerHTML === useFors[i]){
                    console.log(123);
                    cboMultiUseFor[j].selected = true;
                    break;
                }
            }
        };
    };
</script>
</html>
