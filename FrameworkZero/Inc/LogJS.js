window.fw0.LogJS = function(argLogJSName) {
	if (navigator.onLine) {
		var local = {};

		local.data = {};
		local.data.LogJSName = argLogJSName;
		local.data.LogJSDesc = fw0.LogJS.caller.toString();
		local.data.LogCFID = window.fw0.LogCFID;
		window.fw0.LogJSSort += 1;
		local.data.LogJSSort = window.fw0.LogJSSort;
		local.data.LogJSPathName = window.location.pathname;
		local.data.TickCount = window.fw0.TickCount.val();
		local.dataType = 'text'; // no return value.
		local.data.method = 'Save';
		local.Promise = $.ajax(window.fw0.HomeDir.val() + 'com/LogJS.cfc',local);
		//local.Promise.done(LogJSDone);
		//local.Promise.fail(LogJSFail);
	}
	/*
	function LogJSDone(data, textStatus, jqXHR) {
		// debugger;
	}
	function LogJSFail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#xhrResponse').html(jqXHR.responseText);
		debugger;
	}
	*/
}
