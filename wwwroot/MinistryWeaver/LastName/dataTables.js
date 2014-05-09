(function() {
	init();
	function init() {
		var local = {};
		
		local.type = 'GET';
		local.url = 'dataTables.cfc';
		local.dataType = 'json';
		local.data = {};
		local.data.method = 'Top5000';
		local.Promise = $.ajax(local);
		local.Promise.done(done);
		local.Promise.fail(fail);
	};
	function done(RESPONSE,status,xhr) {
		var local = {};
		/*
		$('#realTable').dataTable( {
			"bProcessing": true,
			"bServerSide": true,
			"sAjaxSource": "dataTables.cfm?method=Top5000"
		});
		*/
		local.str = '';
		for (var i in RESPONSE.DATA.LASTNAME) {
			local.str += '<tr><td class="num">' + (+i+1) + '</td><td>' + RESPONSE.DATA.LASTNAME[i] + '</td></tr>';
		}
		$('#realTable tbody')[0].innerHTML = local.str;
		$('#realTable').dataTable();
		/*
		$('#realTable').dataTable({
				"sDom": "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
				"aaSorting": [[ 0, "asc" ]],
				"sPaginationType": "bootstrap",
				"oLanguage": { "sLengthMenu": "_MENU_ records per page" }
		});
		*/
	}
	function fail(xhr,status,response) {
		fw.fail(xhr,status,response);
	}
})();

$('#fake').one('click',documentClicked);
function documentClicked() {
	$('#fake').attr('hidden',true); // fast!
	$('#realDiv').removeAttr('hidden');
}

//$('#fakeNext').click(fakeNextClicked);
//function fakeNextClicked() {
//	$('ul.pagination:last').find('.next').find('a').click();
//}

$('#fakePagination').find('li').click(liClicked);
function liClicked() {
	$('ul.pagination:last').find('a:eq(' + $(this).index() + ')').click();
}

$('#fakeSearch').click(fakeSearchClicked);
function fakeSearchClicked() {
}
