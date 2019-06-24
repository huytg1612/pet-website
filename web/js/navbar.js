/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var navbar = document.getElementById("nav-bar-container");
var navbarBrand = document.getElementById("nav-bar-brand");
var sticky = navbar.offsetTop;

window.onscroll = function myFunc() {
    if (window.pageYOffset > sticky) {
        navbar.classList.add("sticky");
        navbarBrand.style.color = "white";
    } else {
        navbar.classList.remove("sticky");
        navbarBrand.style.color = "#777777";
    }
};

