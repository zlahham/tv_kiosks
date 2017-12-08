var zIndexCounterStart = 0;

function switchPosts() {
    var posts = $(".post");
    var tabs = $(".tab");
    var numberOfPosts = posts.length;
    var zIndex = zIndexCounterStart;

    posts.each(function(){
        if (zIndex >= numberOfPosts - 1) {
            zIndex = 0;
        } else {
            zIndex++;
        }
        $(this).css("z-index", zIndex);
    });

    tabs.each(function(){
        if (zIndex >= numberOfPosts - 1) {
            zIndex = 0;
        } else {
            zIndex++;
        }
       $(this).css("z-index", zIndex);
    });


    if (zIndexCounterStart >= numberOfPosts) {
        zIndexCounterStart = 0;
    } else {
        zIndexCounterStart++;
    }
}

$(document).ready(function() {
    window.setInterval(function(){
        switchPosts();
    }, 1000)
});