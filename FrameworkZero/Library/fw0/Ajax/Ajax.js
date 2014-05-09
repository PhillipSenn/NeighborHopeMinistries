dom.x = $('#x');

(function() {
	$('#x').on('click',xClicked);
	function xClicked() {
		local.type = 'GET';
		local.type = 'POST';
		local.url = '.cfc';
		local.dataType = 'text';
		local.dataType = 'json';
		local.data = {};
		local.data.method = 'Save';
		local.data.ID = dom.x.text();
		local.data.ID = dom.x.val();
		local.context = this;
		local.context = local.data;
		local.Promise = $.ajax(local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	}
	function done(RESPONSE,status,xhr) {
		var local = {};
		
		if (RESPONSE.MSG) {
			$('#msg').text(RESPONSE.MSG);
		} else if (RESPONSE.QRY.ROWCOUNT) {
			local.x = RESPONSE.QRY.DATA.X[0];
		} else {
		}
	}
	function fail(xhr,status,response) {
		fw0.fail(xhr,status,response);
	}
})();