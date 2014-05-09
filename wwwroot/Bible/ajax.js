$(document).on('pagecontainershow', PageShown)

function PageShown(myEvent, myUI ) {
	var local = {}

	local.context = $.mobile.pageContainer.pagecontainer("getActivePage")
	local.type = 'POST'
	local.url = 'Bible.cfc'
	local.dataType = 'text'
	local.data = {}
	local.data.method = 'Save'
	local.data.VerseID = local.context.find('input[name=VerseID]').val()
	local.Promise = $.ajax(local)
	local.Promise.done(done)
	local.Promise.fail(fail)

	function done(response,status,xhr) {
		var local = {}
		$(this.find('.SpoudazoSort')).text(response)
	}
	function fail(xhr,status,response) {
		$('.msg').text(status + ': ' + response);
		$('article').html(xhr.responseText);
		debugger
	}
}




