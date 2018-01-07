/**
 * Applies paintTFLColorsHelper to each TfL line
 */
function paintTFLColors() {
    var lineArray = ["Bakerloo", "Central", "Circle", "District", "Hammersmith",
                    "Jubilee", "Metropolitan", "Northern", "Piccadilly",
                    "Victoria", "Waterloo"];
    for (var index in lineArray) {
        var line = lineArray[index];
        paintTFLColorsHelper(line);
    }

}

/**
 * Applies the line's css class to the tfl indicator widget if the line is currently being displayed
 *
 * @param line The TfL line to be painted
 */
function paintTFLColorsHelper(line) {
    var tflIndicator = document.getElementById('tfl-indicator');
    // Checks if the provided line is currently being displayed in the #tfl-widget
    if ($('#tfl-widget').find('.carousel-item.active').text().indexOf(line) >= 0) {
        // Sets the class of the tflIndicator to the line's name which applies the line's color
        tflIndicator.setAttribute("class", line);
        // Needed to force CSS repaint on Safari
        tflIndicator.style.display='none';
        tflIndicator.offsetHeight; // no need to store this anywhere, the reference is enough
        tflIndicator.style.display='';
    }
}

$(document).ready(function() {
    window.setInterval(function(){
        paintTFLColors();
    })
});