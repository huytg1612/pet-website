<%-- 
    Document   : adminInsertAccessory
    Created on : Jun 6, 2019, 8:03:24 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/SnackBar.css">

        <title>JSP Page</title>
        <style>
            .invalid{
                color:red;
            }
        </style>

    </head>
    <%
        String notice = (String) request.getAttribute("NOTICE");
    %>
    <body class="w3-light-grey" onload="onLoad()">
        <%@include file="../Components/SideBar.jsp" %>
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div class="form-container" style="padding: 2% 20%;">
                <form action="AdminAccessoryMainController" method="POST"  style="background-color: white;padding: 2%">
                    <input type="hidden" name="txtAccessorySearch" value="${param.txtAccessorySearch}"/>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">ID</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Accessory ID"
                               name="txtAccessoryId" value="${param.txtAccessoryId}">
                        <p class="invalid">${requestScope.INVALID.id}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Name</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Name"
                               name="txtAccessoryName" value="${param.txtAccessoryName}">
                        <p class="invalid">${requestScope.INVALID.name}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Price</label>
                        <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Price"
                               name="txtAccessoryPrice" value="${param.txtAccessoryPrice}" step="0.1">
                        <p class="invalid">${requestScope.INVALID.price}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Quantity</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Accessory Quantity"
                               name="txtAccessoryQuantity" value="${param.txtAccessoryQuantity}">
                        <p class="invalid">${requestScope.INVALID.quantity}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Type</label>
                        <select class="form-control" id="exampleFormControlSelect1" name="cboType">
                            <option>Collar</option>
                            <option>Clothes</option>
                            <option>Toys</option>
                            <option>Feeding</option>
                            <option>Bedding</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Made in</label>
                        <select class="form-control" id="exampleFormControlSelect1" name="cboMadeIn">
                            <option>Vietnam</option>
                            <option>China</option>
                            <option>Japan</option>
                            <option>America</option>
                            <option>England</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Use for</label>
                        <select multiple class="form-control" id="exampleFormControlSelect2" name="cboMultiUseFor">
                            <option>Dog</option>
                            <option>Cat</option>
                            <option>Fish</option>
                            <option>Hamster</option>
                            <option>Bird</option>
                        </select>
                        <p class="invalid">${requestScope.INVALID.userFor}</p>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlFile1">Choose image</label>
                        <input type="file" class="form-control-file" id="exampleFormControlFile1" accept="image/png, image/jpeg" name="fileImage">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Description</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="txtAccessoryDescrip">${param.txtAccessoryDescrip}</textarea>
                    </div>
                    <br>
                    <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" name="action" value="Insert">Insert</button>
                </form>
            </div>
        </div>
        <div id="snackbar"></div>
        <script type="text/javascript" src="js/SnackBar.js" ></script>
        <script type="text/javascript">
        function onLoad() {
            if (${requestScope.NOTICE != null}) {
                showSnackBar('${requestScope.NOTICE}');
            }
        }
        </script>
    </body>
</html>
