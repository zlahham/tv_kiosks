function startTimeAndDate() {
    var today = new Date();
    var hour = formatTime(today.getHours());
    var minute = formatTime(today.getMinutes());
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();
    $('#div-time')[0].innerHTML = hour + ':' + minute;
    $('#div-date')[0].innerHTML = day + '/' + month + '/' + year;
    var t = setTimeout(startTimeAndDate, 500);
}

function formatTime(time) {
  if (time < 10) {
    time = '0' + time;
  }
  return time;
}

$(document).ready(function() {
  startTimeAndDate();
});
