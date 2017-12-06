$(function($) {

  // jQuery marquee
  $('.marquee').marquee({
	allowCss3Support: true,
	css3easing: 'linear',
	// note: the other options affect speed as well
	speed: 50,
	//time in milliseconds before the marquee will start animating
	delayBeforeStart: 0,
	direction: 'left',
	//true or false - should the marquee be duplicated to show an effect of continuous flow
	duplicated: true,
	//gap in pixels between the tickers (only works when duplicated is true)
	gap: 1000
  });

});
