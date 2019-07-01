/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function setDayPicker() {
    var datePicker = document.getElementById('date-picker');
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    var today = new Date();

    for (var i = 0; i < 7; i++) {
        var day = days[today.getDay()];
        var opt = document.createElement('option');

        var month = today.getUTCMonth() + 1; //months from 1-12
        var date = today.getUTCDate();
        var year = today.getUTCFullYear();

        opt.appendChild(document.createTextNode(day + ' (' + year + '-' + month + '-' + date + ')'));
        opt.value = year + '-' + month + '-' + date + '';

        today.setDate(today.getDate() + 1);

        datePicker.appendChild(opt);
    }

    setTimePicker();
}

function  clearSelectOption() {
    var timePicker = document.getElementById('time');
    var length = timePicker.length;

    console.log('length: '+length);
    for (var i = 0; i < length; i++) {
        timePicker.remove(0);
    }
}

function setTimePicker() {
    clearSelectOption();

    var timePicker = document.getElementById('time');
    var datePicker = document.getElementById('date-picker');
    var today = new Date();

    var indexDate = datePicker.selectedIndex;

    var hours, minutes;

    if (indexDate === 0) {
        hours = today.getHours();
        minutes = today.getMinutes();

        if (minutes > 15) {
            hours = hours + 2;
        } else {
            hours = hours + 1;
        }
    } else {
        hours = 8;
    }

    if (hours <= 16) {        
        for (var i = hours; i <= 16; i++) {
            var opt = document.createElement('option');

            opt.appendChild(document.createTextNode(i + ':00 to ' + (i + 1) + ':00'));
            opt.value = i + ':00 to ' + (i + 1) + ':00';

            timePicker.appendChild(opt);
        }
    } else {
        var opt = document.createElement('option');

        opt.appendChild(document.createTextNode('Time Out'));
        opt.value = 'Time Out';

        timePicker.appendChild(opt);
    }

}

