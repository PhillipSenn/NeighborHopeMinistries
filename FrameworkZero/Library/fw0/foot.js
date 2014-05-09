window.log = function(X){
	console.log(X);
};

window.fw0 = {};

$('form').on('click','button:submit[name="Delete"]',function() {
	return window.confirm(this.title || 'Delete this record?');
});

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
