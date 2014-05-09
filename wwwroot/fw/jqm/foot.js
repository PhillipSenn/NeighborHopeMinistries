// Defaults for jQuery Mobile 1.4.2+
(function() {
	$('section').attr('data-role','page');
		$('header').attr('data-role','header');
		$('article').attr('role','main').addClass('ui-content'); // http://demos.jquerymobile.com/1.4.0/pages/
			$('article ul, article ol').attr('data-role','listview').attr('data-inset','true');
			$('article a').not('.no-btn').addClass('ui-btn'); // ,button,input[button],input[submit],input[reset]
			$('.ui-btn').not('.no-corner-all').addClass('ui-corner-all');
		//content
		$('footer').attr('data-role','footer');
	//page
	
	if ($('#ajaxEnabled').length) { // if enabled
		// let jqm default to ajaxifying the hyperlinks
	} else {
		$(document).bind('mobileinit', mobileInit)
	}
	function mobileInit() {
		$.mobile.ajaxEnabled = false;
	};
})();

window.log = function(x) {
	console.log(x)
}