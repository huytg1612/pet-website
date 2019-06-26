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

function checkOut() {
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            $('#shopping-cart').load('accessory/viewCart.jsp #myTable');

            var responseMSG = this.responseText;
            var myModal = document.getElementById("myModal");
            var notice = document.getElementById("myModal-notice");
            var link = document.getElementById("myModal-link");

            if (responseMSG === "Login") {
                notice.innerHTML = "You need to login to check out";
                myModal.style.display = "block";
            }

            if (responseMSG === "Success") {
                showSnackBar(this.responseText);
            }
        }
    };
    xhttp.open("POST", "CartMainController", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("action=CheckOut");
}