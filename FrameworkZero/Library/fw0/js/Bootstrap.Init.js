(function() {
	$(document).on('mouseenter', 'button:submit[name="Delete"]', function() {
		$(this).addClass('btn-danger');
	});
	$(document).on('mouseleave', 'button:submit[name="Delete"]', function() {
		$(this).removeClass('btn-danger');
	});
	$('table').not('.no-table').addClass('table').wrap('<div class="table-responsive"></div>');
	$('table').not('.no-table,.no-hover').addClass('table-hover');
	$('table').not('.no-table,.no-striped').addClass('table-striped');
	$('table').not('.no-table,.no-bordered').addClass('table-bordered');
	$('table').not('.no-table,.no-condensed').addClass('table-condensed');
	
	$('textarea,input:text,input:password,input[type=email],select').addClass('form-control');

	$('.btn-lg,.btn-block,.btn-default,.btn-primary,.btn-success,.btn-info,.btn-warning,.btn-danger,.btn-link').addClass('btn');
	$('button').addClass('btn');
	$('.btn').not('.btn-normal').addClass('btn-lg');
	$('#Save,button[name=Save]').addClass('btn-primary');
	$('.btn')
		.not('.btn-success')
		.not('.btn-primary')
		.not('.btn-info')
		.not('.btn-warning')
		.not('.btn-danger')
		.addClass('btn-default');

	$('nav').addClass('navbar');
	$('.navbar').not('navbar-inverse').addClass('navbar-default')
	
	$('article,footer,header,main').addClass('row'); // section=container

	// $('img').not('[hidden]').addClass('img-responsive'); // img-rounded
	$('section').removeAttr('hidden'); // FOUC
})();