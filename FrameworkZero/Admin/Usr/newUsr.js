(function() {
	$('#Save').on('click',SaveClicked);
	function SaveClicked() {
		var local = {};

		local.data = {};
		local.dataType = 'text'; // Remember to use this if there is no return value.
		local.data.UsrName = $('#UsrName').val();
		local.data.UsrSort = $('#UsrSort').val();
		local.data.UsrPass = $('#UsrPass').val();
		local.data.isAdmin = $('#isAdmin').val(); // || 0?
		debugger;
		local.data.method = 'Insert'; // Insert?
		local.Promise = $.ajax('newUsr.cfc',local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(result,textStatus,jqXHR) {
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#xhrResponse').html(jqXHR.responseText);
		debugger; // I should do this
	}
})();
