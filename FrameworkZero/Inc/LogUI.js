window.fw0.HomeDir = $('#HomeDir');
window.fw0.TickCount = $('#TickCount');
window.fw0.LogJSSort = 0;

(function() {
	$(document).on('click','a',aLog);
	$(document).on('click','button',btnLog);
	$(document).on('change','input:checkbox',chkLog);
	$(document).on('mousedown',':radio',RadioMouseDown);
	$(document).on('change','input:radio',RadioLog);
	$(document).on('change','input:not(:checkbox,:radio)',inputLog);
	$(document).on('change','textarea',TextareaLog);

	function RadioMouseDown() {
		var local = {};
		local.Name = $(this).attr('name');
		$('input[name=' + local.Name + ']:radio').each(function(index, element) {
			if ($(this).is(':checked')) {
				local.Destination = 'deSelected';
				local.Save = Save.bind(this,local.Destination);
				local.Save('radio');
			}
		});
	}
	function RadioLog() {
		var local = {};

		if ($(this).is(':checked')) {
			local.Destination = 'Selected';
		} else {
			local.Destination = 'unChecked';
		}
		local.Save = Save.bind(this,local.Destination);
		local.Save('radio');
	}
	function inputLog() {
		var local = {};

		local.Destination = '';
		local.Save = Save.bind(this,local.Destination);
		local.Save('text');
	}
	function TextareaLog() {
		var local = {};

		local.Destination = $(this).text();
		local.Save = Save.bind(this,local.Destination);
		local.Save('text');
	}

	function chkLog() {
		var local = {};

		if ($(this).is(':checked')) {
			local.Destination = 'Checked';
		} else {
			local.Destination = 'unChecked';
		}
		local.Save = Save.bind(this,local.Destination);
		local.Save('check');
	}

	function aLog() {
		var local = {};

		local.Destination = $(this).attr('href') || '';
		local.Save = Save.bind(this,local.Destination);
		local.Save('anchor');
	}
	function btnLog() {
		var local = {};

		local.Destination = $(this).closest('form').attr('action') || '';
		local.Save = Save.bind(this,local.Destination);
		local.Save('button');
	}

	function Save(argDestination,argTag) {
		if (navigator.onLine) {
			var local = {};

			local.data = {};
			local.data.LogUITag = argTag;
			local.data.LogUITagName = $(this).attr('name') || '';
			if (this.id) {
				local.data.LogUIIdentifier = '#' + this.id;
			} else {
				local.data.LogUIIdentifier = '';
			}
			if ($(this).val()) {
				local.data.LogUIValue = $(this).val();
			} else {
				local.data.LogUIValue = '';
			}
			local.data.LogUIClass = this.className || '';
			local.data.LogUIDestination = argDestination;
			window.fw0.LogJSSort += 1;
			local.data.LogJSSort = window.fw0.LogJSSort;
			local.data.TickCount = window.fw0.TickCount.val();
			local.data.LogCFID = window.fw0.LogCFID;
			local.dataType = 'text'; // no return value.
			local.data.method = 'Save';
			local.Promise = $.ajax(window.fw0.HomeDir.val() + 'com/LogUI.cfc',local);
			local.Promise.done(done);
			local.Promise.fail(fail);
		}
	}
	function done(data, textStatus, jqXHR) {
		// debugger;
	}
	function fail(jqXHR, textStatus, errorThrown) {
		$('#textStatus').text('Status: ' + textStatus + '. ');
		$('#errorThrown').text('Error thrown: ' + errorThrown);
		$('#xhrResponse').html(jqXHR.responseText);
		debugger;
	}
})();
