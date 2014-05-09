(function() {
	$('select').change(SelectChanged);
	function SelectChanged() {
		var local = {};

		local.UsrName = $(this).find(':selected').text();
		local.data = {};
		local.data.UsrID = $(this).val();
		local.dataType = 'text'; // no return value.
		local.context = this;
		local.data.method = 'Save';
		local.Promise = $.ajax('/FrameworkZero/Login/Login.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(RESULT,textStatus,jqXHR) {
		var local = {};
		
		local.UsrName = $(this).find(':selected').text();
		$('#navUsrName').html(local.UsrName + '<b class="caret"></b>');
		$('h1').text('You are now logged in.');
		$('.container:last').append('<a href="/FrameworkZero">Click here to see the main menu</a>');
		$('#UsrID').parent().attr('hidden',true);
		debugger;
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#xhrResponse').html(jqXHR.responseText);
		debugger;
	}
})();


