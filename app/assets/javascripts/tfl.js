function paintTFLColors() {
    var lineArray = ["Bakerloo", "Central", "Circle", "District", "Hammersmith",
                    "Jubilee", "Metropolitan", "Northern", "Piccadilly",
                    "Victoria", "Waterloo"];
    for (var index in lineArray) {
        var line = lineArray[index];
        paintTFLIndicatorHelper(line);
    }

}

function paintTFLIndicatorHelper(line) {
    var tflIndicator = document.getElementById('tfl-indicator');
    if ($('#tfl-widget').find('.carousel-item.active').text().indexOf(line) >= 0) {
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