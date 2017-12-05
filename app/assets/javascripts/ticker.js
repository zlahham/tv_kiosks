$( document ).ready(function() {
  console.log( "ready!" );

  // jQuery marquee
  $('.marquee').marquee({
	allowCss3Support: true,
	css3easing: 'linear',
	// note: the other options affect speed as well
	speed: 100,
	//time in milliseconds before the marquee will start animating
	delayBeforeStart: 0,
	direction: 'left',
	//true or false - should the marquee be duplicated to show an effect of continuous flow
	duplicated: false,
	//gap in pixels between the tickers (only works when duplicated is true)
	gap: 50
  });

  // jQuery ticker; currently not in use. Uncomment this and the code
  // in show.html.erb to activate
  /*$.fn.ticker.defaults = {
    random:        false, // Whether to display ticker items in a random order
    itemSpeed:     3000,  // The pause on each ticker item before being replaced
    cursorSpeed:   40,    // Speed at which the characters are typed
    pauseOnHover:  false,  // Whether to pause when the mouse hovers over the ticker
    finishOnHover: false,  // Whether or not to complete the ticker item instantly when moused over
    cursorOne:     '',   // The symbol for the first part of the cursor
    cursorTwo:     '',   // The symbol for the second part of the cursor
    fade:          true,  // Whether to fade between ticker items or not
    fadeInSpeed:   800,   // Speed of the fade-in animation
    fadeOutSpeed:  800    // Speed of the fade-out animation
  };
  $('.ticker').ticker();*/

});
