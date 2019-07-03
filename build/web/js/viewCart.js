/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function onChangeQuantity(id, quantity) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            $('#shopping-cart').load('accessory/viewCart.jsp #myTable');

            showSnackBar(this.responseText);
        }
    };
    xhttp.open("POST", "CartMainController", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("action=Update&txtAccessoryID=" + id + "&txtQuantity=" + quantity);
}

function removeItem(id, index) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            $('#shopping-cart').load('accessory/viewCart.jsp #myTable');

            showSnackBar(this.responseText);
        }
    };
    xhttp.open("POST", "CartMainController", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("action=Delete&txtAccessoryID=" + id);
}