// The tab and post to be displayed is selected using the mainIndex variable -
// the previous post is made invisible using prevMainIndex.
var mainIndex = 0;
var prevMainIndex = 0;
var loopedOnce = 0;

//This function handles the youtube embedded video being paused while 
function toggleVideo(state, div) {
    // if state == 'hide', hide. Else: show video
    //var div = document.getElementByClassName("video-post");
    var iframe = div.find("iframe")[0].contentWindow;
    //div.style.display = state == 'hide' ? 'none' : '';
    func = state == 'hide' ? 'stopVideo' : 'playVideo';
    iframe.postMessage('{"event":"command","func":"' + func + '","args":""}', '*');
}

/**
 * This function handles the switching of available posts and category tabs in the kiosk if there are more
 * than 1 post available using jQuery fade animations and z-stacking.
 */
function switchPosts() {
    var posts = $(".post");
    var tabs = $(".tab");
    var transitionTime = 1500;
    // Retrieves the duration of each individual post through the custom 'duration' attribute
    var postDuration = $($(posts).get(mainIndex)).attr('duration') * 1000;

    // Only switches posts if there are more than 1 post
    if (posts.length > 1) {
        //If post is a video play it
        if ($($(posts).get(mainIndex)).hasClass('video-post'))
        {
            toggleVideo('show',$($(posts).get(mainIndex)));
        }

        // Places the post with number mainIndex at the top and moves the prevMainIndex post to the back
        $($(posts).get(mainIndex)).css("z-index", 1);
        $($(posts).get(prevMainIndex)).css("z-index", 0);
        // Places the tab with number mainIndex at the top and moves the prevMainIndex tab to the back
        $($(tabs).get(mainIndex)).css("z-index", 1);
        $($(tabs).get(prevMainIndex)).css("z-index", 0);
        // Fades in the mainIndex post using the jQuery fadeIn animation
        // Display is set to flex to ensure correct rendering of the posts
        $($(posts).get(mainIndex)).fadeIn(transitionTime).css("display", "flex");
        $($(tabs).get(mainIndex)).fadeIn(transitionTime).css("display", "block");

        // After the transition is finished, the previously displayed post is hidden
        setTimeout(function () {
            if ($($(posts).get(prevMainIndex - 1)).hasClass('video-post'))
            {
                toggleVideo('hide',$($(posts).get(prevMainIndex - 1)));
            }
            $($(posts).get(prevMainIndex - 1)).hide();
            $($(tabs).get(prevMainIndex - 1)).hide();
        }, transitionTime);

        // Increments prevMainIndex and mainIndex while ensuring that prevMainIndex is always
        // 1 behind mainIndex and that both restart at 0 after reaching the total number of posts
        if (mainIndex >= posts.length - 1) {
            loopedOnce = 1;
            mainIndex = 0;
            prevMainIndex = posts.length -1;
        } else {
            prevMainIndex = mainIndex;
            mainIndex++;
        }
    // If less than 2 posts are available, the first available post is displayed without transitions
    } else {
        $($(posts).get(mainIndex)).css("z-index", 1);
        $($(posts).get(mainIndex)).css("display", "flex");

        $($(tabs).get(mainIndex)).css("z-index", 1);
        $($(tabs).get(mainIndex)).css("display", "flex");
    }

    // Function call with delay equal to current post's duration attribute
    window.setTimeout(switchPosts, postDuration);
}

$(document).on('turbolinks:load', function() {
    switchPosts();
});
