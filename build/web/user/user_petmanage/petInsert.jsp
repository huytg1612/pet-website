<%-- 
    Document   : petInsert
    Created on : Jun 24, 2019, 5:03:22 PM
    Author     : SE130226
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="../../css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="../../fontFamily.css">

        <title>JSP Page</title>
    </head>
    <body onload="myAlert()">
        <%@include file="../../Components/NavBar.jsp" %>

        <div id="form-container">
            <form action="PetMainController" method="POST">
                <div class="form-group">
                    <label for="exampleInputText">Pet name</label>
                    <input type="text" class="form-control" id="exampleInputText" name="txtPetName">
                    <p class="error-notice">${requestScope.INVALID.nameError}</p>
                </div>
                <div class="form-group">
                    Date of birth:<input type="date" class="form-control" id="validationDefault02" name="txtPetDOB">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Sex</label>
                    <select class="form-control" id="exampleFormControlSelect1" name="cboPetSex">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                    <p class="error-notice">${requestScope.INVALID.sexError}</p>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect2">Pet type</label>
                    <select class="form-control" id="exampleFormControlSelect2" name="cboPetType">
                        <option>Dog</option>
                        <option>Cat</option>
                        <option>Fish</option>
                        <option>Hamster</option>
                        <option>Bird</option>
                    </select>
                    <p class="error-notice">${requestScope.INVALID.typeError}</p>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlFile1">Choose pet image</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1" accept="image/png, image/jpeg" name="filePetImage">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Pet description</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="txtPetDescription"></textarea>
                </div>
                <button type="submit" class="btn btn-primary" name="action" value="Insert">Insert</button>
            </form>
        </div>
        <script type="text/javascript">
            function myAlert() {
                if (request.getAttribute("NOTICE") !== null)
                    alert(<%= (String) request.getAttribute("NOTICE")%>);
            }
        </script>
    </body>
</html>
