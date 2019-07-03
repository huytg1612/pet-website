<%-- 
    Document   : viewCart
    Created on : Jun 18, 2019, 10:08:49 PM
    Author     : SE130226
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">    
<link rel="stylesheet" type="text/css" href="css/viewCart.css">
<link rel="stylesheet" type="text/css" href="css/SnackBar.css">

<link rel="stylesheet" type="text/css" href="fontFamily.css">
<link rel="stylesheet" type="text/css" href="css/NavBar.css">

<script type="text/javascript" src="js/SnackBar.js"></script>
<script type="text/javascript" src="js/viewCart.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="showNotice()">
        <%@include file="../Components/NavBar.jsp" %>

        <div id="shopping-cart">
            <div id="myTable" class="container" style="padding: 0 10%;">
                <c:if test="${sessionScope.CART.size > 0}">

                    <div style="width: 100%;height: auto;">
                        <h1>${sessionScope.CART.size} item in cart </h1>
                    </div>
                    <table id="cart" class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                <th style="width:50%">Product</th>
                                <th style="width:10%">Price</th>
                                <th style="width:8%">Quantity</th>
                                <th style="width:22%" class="text-center">Subtotal</th>
                                <th style="width:10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="mapElement" items="${sessionScope.CART.cart}" varStatus="theCount">
                                <tr>
                                    <c:set var="dtoAccess" value="${mapElement.value}"></c:set>
                                        <td data-th="Product">
                                            <div class="row">
                                                <div class="col-sm-2 hidden-xs"><img src="<%= request.getContextPath()%>${dtoAccess.image}" alt="..." class="img-responsive"/></div>
                                            <div class="col-sm-10">
                                                <h4 class="nomargin">${dtoAccess.name}</h4>
                                                <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price">${dtoAccess.price}</td>
                                    <td data-th="Quantity">
                                        <input type="number" class="form-control text-center" value="${dtoAccess.quantity}" min="1" id="quantity" 
                                               onchange="onChangeQuantity('${dtoAccess.id}', this.value)">
                                    </td>
                                    <td data-th="Subtotal" class="text-center" id="sub-total">${dtoAccess.price * dtoAccess.quantity}</td>
                                    <td class="actions" data-th="">
                                        <form action="CartMainController" method="POST">

                                        </form>
                                        <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                        <button class="btn btn-danger btn-sm" onclick="removeItem('${dtoAccess.id}', '${theCount.count}')"><i class="fa fa-trash-o"></i></button>
                                    </td>
                                </tr>                    
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr class="visible-xs">
                                <td class="text-center"><strong>Total 1.99</strong></td>
                            </tr>
                            <tr>
                                <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                <td colspan="2" class="hidden-xs"></td>
                                <td class="hidden-xs text-center"><strong>Total ${sessionScope.CART.total}</strong></td>
                                <td>
                                    <form action="CartMainController" method="POST">
                                        <button class="btn btn-success btn-block" name="action" value="CheckOut" type="submit">Checkout <i class="fa fa-angle-right"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>            
            </div>
            \
            <div id="snackbar"></div>

            <div class="modal" tabindex="-1" role="dialog" id="myModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Notice</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="myModal-notice">Modal body text goes here.</p>
                            <a href="login.jsp">Go to login</a>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                                    onclick="document.getElementById('myModal').style.display = 'none';">Close
                            </button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.CART.size == 0 or sessionScope.CART == null}">
                    <h1>Nothing in your cart</h1>
                </c:if>
            </div>
        </div>
        <script>
            function showNotice() {

                var myModal = document.getElementById("myModal");
                var notice = document.getElementById("myModal-notice");
                var link = document.getElementById("myModal-link");

                if (<%= request.getAttribute("NOTICE") != null%>) {
                    if (${requestScope.NOTICE eq "Login"}) {
                        notice.innerHTML = "You need to login to check out";
                        myModal.style.display = "block";
                    }
                }
            }
        </script>
    </body>
</html>
