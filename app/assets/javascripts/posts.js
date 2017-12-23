var mainIndex = 0;
var prevMainIndex = 0;

function switchPosts() {
    var posts = $(".post");
    var tabs = $(".tab");
    var numberOfPosts = posts.length - 1;
    var transitionTime = 1000;
    var postDuration = $($(posts).get(mainIndex)).attr('duration') * 1000;

    $($(posts).get(mainIndex)).css("z-index", 1);
    $($(posts).get(prevMainIndex)).css("z-index", 0);

    $($(posts).get(mainIndex)).fadeIn(transitionTime).css("display","flex");
    $($(tabs).get(mainIndex)).fadeIn(transitionTime).css("display","flex");

    setTimeout(function(){
        $($(posts).get(prevMainIndex - 1)).hide();
        $($(tabs).get(prevMainIndex - 1)).hide();
    }, transitionTime);

    if (mainIndex >= numberOfPosts) {
        mainIndex = 0;
        prevMainIndex = numberOfPosts;
    } else {
        prevMainIndex = mainIndex;
        mainIndex++;
    }
    // Recursive function call with delay equal to current post's duration attribute
    window.setTimeout(switchPosts, postDuration);
}


$(document).on('turbolinks:load', function() {
    switchPosts();
});
