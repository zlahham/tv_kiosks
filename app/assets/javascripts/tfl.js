function paintTFLColors() {
    var lineArray = ["Bakerloo", "Central", "Circle", "District", "Hammersmith",
                    "Jubilee", "Metropolitan", "Northern", "Piccadilly",
                    "Victoria", "Waterloo"];
    for (var index in lineArray) {
        var line = lineArray[index];
        paintTFLIndicatorHelper(line);
        console.log(line);
    }
}

function paintTFLIndicatorHelper(line) {
    var tflIndicator = document.getElementById('tfl-indicator');
    if ($('#tfl-widget').find('.carousel-item.active').text().indexOf(line) >= 0) {
        tflIndicator.setAttribute("class", line);
    }
}

$(document).ready(function() {
    window.setInterval(function(){
        paintTFLColors();
    })
});