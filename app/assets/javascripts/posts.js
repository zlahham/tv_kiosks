var mainIndex = 0;
var prevMainIndex = 0;

    function switchPosts() {
        var posts = $(".post");
        var tabs = $(".tab");
        var numberOfPosts = posts.length - 1;
        var transitionTime = 1000;

        $($(posts).get(mainIndex)).css("z-index", 1);
        $($(posts).get(prevMainIndex)).css("z-index", 0);

        $($(posts).get(mainIndex)).fadeIn(transitionTime);
        $($(tabs).get(mainIndex)).fadeIn(transitionTime);

        setTimeout(function(){
            $($(posts).get(prevMainIndex - 1)).hide();
            $($(tabs).get(prevMainIndex - 1)).hide();
        }, transitionTime);

        /*
        posts.each(function () {
            $(this).css("z-index", postIndex);
            if (postIndex >= numberOfPosts) {
                postIndex = 0;
            } else {
                postIndex++;
            }

        });

        tabs.each(function () {
            if (tabIndex >= numberOfPosts) {
                tabIndex = 0;
            } else {
                tabIndex++;
            }
            $(this).css("z-index", tabIndex);
        });


        */

        if (mainIndex >= numberOfPosts) {
            mainIndex = 0;
            prevMainIndex = numberOfPosts;
        } else {
            prevMainIndex = mainIndex;
            mainIndex++;
        }
    }


$(document).ready(function() {
    window.setInterval(function(){
        //switchPosts();
    }, 2000)
});