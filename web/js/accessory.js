/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var products = document.getElementsByClassName('card');
var numberButton = document.getElementsByClassName('page-item-number');
var urlParams = new URLSearchParams(window.location.search);

var currentNumber = urlParams.get('page') - 1;
var currentItemNumber = urlParams.get('page');

function setDefault() {
    if (urlParams.get('page') === null) {
        currentNumber = 0;
        currentItemNumber = 1;
    }
}

window.onload = function myProducts() {
    setDefault();
    setPrevNext(currentItemNumber);

    var length = products.length;
    document.getElementsByClassName('page-item-number')[currentNumber].classList.add('active');

    for (var i = 0; i < length; i++) {
        products[i].style.display = "none";
    }

    clickNumber(currentItemNumber);
};

function clickPrevNext(which) {
    if (which === 'prev') {
        if (currentNumber > 0) {
            clickNumber(currentItemNumber - 1);
            currentItemNumber = currentItemNumber - 1;
        }

    } else {
        clickNumber(currentItemNumber + 1);
        currentItemNumber = currentItemNumber + 1;
    }

}

function clickNumber(number) {
    currentNumber = number - 1;

    var productLoad = 0;

    if (number * 8 > products.length) {
        productLoad = products.length;
    } else {
        productLoad = number * 8;
    }

    for (var i = (number - 1) * 8; i < productLoad; i++) {
        products[i].style.display = "block";
    }

}

function setPrevNext(number) {
    var prev = document.getElementById('page-item-prev');
    var next = document.getElementById('page-item-next');

    if (number === '1') {
        prev.classList.add('disabled');
    } else {
        prev.classList.remove('disabled');
    }

    if (number === numberButton.length.toString()) {
        next.classList.add('disabled');
    } else {
        next.classList.remove('disabled');
    }
}

function setURL() {

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    xhttp.open("POST", "AccessoryMainController?action=Load&txtAccessorySearch=&page=1", true);
    xhttp.send();
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
