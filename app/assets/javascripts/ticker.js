$( document ).ready(function() {
  console.log( "ready!" );
  $.fn.ticker.defaults = {
    random:        true, // Whether to display ticker items in a random order
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
  $('.ticker').ticker();
});
