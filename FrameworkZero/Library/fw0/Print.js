(function() {
	if (!$('#Print').length) {
		if ($('.container').length) {
			$('.container:last').append('<p id="Print"></p>');
		} else {
			$('body').append('<p id="Print"></p>');
		}
	}
	window.fw0.Print = $('#Print');
})();

function Print(x) {
	window.fw0.Print.append(x + '<br>');
}