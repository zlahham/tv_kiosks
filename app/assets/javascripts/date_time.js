function startTimeAndDate() {
    var today = new Date();
    var hour = today.getHours();
    var minute = today.getMinutes();
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();
    document.getElementById('div-time').innerHTML = hour + ':' + minute;
    document.getElementById('div-date').innerHTML = day + '/' + month + '/' + year;
    var t = setTimeout(startTimeAndDate, 500);
}

$( document ).ready(function() {
  startTimeAndDate();
});
