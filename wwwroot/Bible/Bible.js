$(document).on('swipeleft', 'section', swipedLeft)
function swipedLeft() {
	$(this).find('.next').click()
}
$(document).on('swiperight', 'section', swipedRight)
function swipedRight() {
	$(this).find('.prev').click()
}
$('.KJV').click(KJVClicked)
function KJVClicked() {
	if ($(this).hasClass('btn-primary')) {
		$('.KJV').removeClass('btn-primary');
		$('.KJVVerse').slideUp('slow');
	} else {
		$('.KJV').addClass('btn-primary');
		$('.KJVVerse').slideDown('slow');
	}
}

$('.NASB').click(NASBClicked)
function NASBClicked() {
	if ($(this).hasClass('btn-primary')) {
		$('.NASB').removeClass('btn-primary');
		$('.NASBVerse').slideUp('slow');
	} else {
		$('.NASB').addClass('btn-primary');
		$('.NASBVerse').slideDown('slow');
	}
}

