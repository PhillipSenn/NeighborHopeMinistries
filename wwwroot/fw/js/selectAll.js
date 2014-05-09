(function() {
	$(document).on('click','#selectAll',selectAll);
	function selectAll() {
		if ($(this).is(':checked')) {
			$(this).closest('table').find('input:checkbox').prop('checked',true);
		} else {
			$(this).closest('table').find('input:checkbox').removeAttr('checked');
		}
	}
})();
