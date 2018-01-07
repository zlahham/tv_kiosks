/**
 * This function provides the time in format HH:MM and date in format DD/MM/YYYY
 * and places them as the HTML content of the elements #div-time and #div-date respectively.
 * It calls itself every 500ms.
 */
function startTimeAndDate() {
    var delay = 500;
    var today = new Date();
    var hour = formatTime(today.getHours());
    var minute = formatTime(today.getMinutes());
    var day = today.getDate();
    var month = today.getMonth() + 1; // getMonth returns number from 0-11
    var year = today.getFullYear();
    $('#div-time')[0].innerHTML = hour + ':' + minute;
    $('#div-date')[0].innerHTML = day + '/' + month + '/' + year;
    // Calls itself after a delay
    var t = setTimeout(startTimeAndDate, delay);
}

/**
 * Formats a number so that it is has a leading zero if it contains of only a single digit.
 *
 * @param time The unformatted number of minutes or hours eg. 7
 * @returns time The formatted number of minutes or hours eg. 07
 */
function formatTime(time) {
  if (time < 10) {
    time = '0' + time;
  }
  return time;
}

$(document).ready(function() {
  startTimeAndDate();
});
