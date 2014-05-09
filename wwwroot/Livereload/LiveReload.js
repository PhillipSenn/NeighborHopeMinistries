dom.FileName = $('#FileName')
dom.Query_String = $('#Query_String')
dom.CountDown = $('#CountDown')

;(function() {
	var Variables = {}

	if (dom.FileName) {
		Variables.FileName = dom.FileName.val()
	} else {
		Variables.FileName = ''
	}

	StartTheCountDown()
	function StartTheCountDown() {
		Variables.CountDown = 50
		dom.CountDown.text(Variables.CountDown)
		setTimeout(LiveReload,100)
	}
	function LiveReload() {
		var local = {}

		Variables.CountDown -= 1
		if (Variables.CountDown) {
			dom.CountDown.text(Variables.CountDown)
			setTimeout(LiveReload,100)
		} else {
			local.type = 'GET'
			local.url = 'LiveReload.cfc'
			local.dataType = 'text'
			local.data = {}
			local.data.method = 'Save'
			local.data.FileName = Variables.FileName
			local.Promise = $.ajax(local)
			local.Promise.done(done)
			local.Promise.fail(fail)
		}
	}

	function done(response,status,xhr) {
		if (response == 'Reload') {
			debugger
			location.reload(true)
		}
		StartTheCountDown()
	}
	function fail(xhr,status,response) {
		debugger
	}
})()
