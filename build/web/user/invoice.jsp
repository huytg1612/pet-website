<%-- 
    Document   : invoice
    Created on : Jun 20, 2019, 4:27:58 PM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/NavBar.css">
        <link rel="stylesheet" type="text/css" href="fontFamily.css">
        <link rel="stylesheet" type="text/css" href="css/user_page.css">
        <link rel="stylesheet" type="text/css" href="css/UserSideBar.css">

    </head>
    <body onload="popUpModal()" id="body-style">
        <%@include file="../Components/NavBar.jsp" %>

        <div id="container-page">
            <%@include file="../Components/UserSideBar.jsp" %>
            <div id="component-right">
                <c:set var="list" value="${requestScope.LIST_Invoice}"/>

                <c:if test="${list != null}">
                    <c:if test="${list.size() > 0}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Total</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dtoInvoice" items="${list}" varStatus="theCount">
                                    <tr>
                                        <th scope="row">${theCount.count}</th>
                                        <td>${dtoInvoice.date}</td>
                                        <td>${dtoInvoice.total}</td>
                                        <td>
                                            <form action="MainController" method="POST">
                                                <button type="submit" class="btn btn-primary" name="action" value="InvoiceDetail">
                                                    Details
                                                </button>                                       
                                                <input type="hidden" type="text" name="txtInvoiceID" value="${dtoInvoice.id}"/>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>                
                    </c:if>
                </c:if>

                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document" >
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Invoice ID: ${dtoInvoice.id}<br/>Date:${dtoInvoice.date}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <c:set var="listInvoiceDetails" value="${requestScope.DTO_InvoiceDetails}"/>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Sub-price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="dtoInvoiceDetail" items="${listInvoiceDetails}" varStatus="countNo">
                                            <tr>
                                                <th scope="row">${countNo.count}</th>
                                                <td>${dtoInvoiceDetail.invoiceId}</td>
                                                <td>${dtoInvoiceDetail.accessoryName}</td>
                                                <td>${dtoInvoiceDetail.accessoryPrice}</td>
                                                <td>${dtoInvoiceDetail.quantity}</td>
                                                <td>${dtoInvoiceDetail.quantity * dtoInvoiceDetail.accessoryPrice}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <h5>Total:</h5>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function popUpModal() {
                if (<%= request.getAttribute("DTO_InvoiceDetails") != null%>)
                {
                    $('#exampleModalCenter').modal('show');
                }
            }
            ;
        </script>
    </body>

</html>
