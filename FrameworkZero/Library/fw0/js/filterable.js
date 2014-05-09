(function() {
	var Variables = {};
	Variables.theadID = 0;

	// For every thead
	$('thead').not('.no-filter').each(function(index, thead) {
		var local = {};
		
		if ($(thead).attr('id')) {
			local.id = $(thead).attr('id');
		} else {
			// We'll assign a unique id
			Variables.theadID += 1;
			local.id = 'fw0Thead' + Variables.theadID;
			$(thead).attr('id',local.id);
		}
		// Set the max-width for each column via css.
		local.str = '';
		$('th',this).each(function(index, element) { // for every th inside of this thead
			if (!$(this).hasClass('no-filter')) {
				local.str += '#' + local.id;
				local.str += ' tr.fw0Filter th:nth-child(' + (index+1) + ') {';
				local.str += '	max-width:' + $(this).width() + 'px;';
				local.str += '}';
			}
		});
		local.css = document.createElement("style");
		local.css.type = "text/css";
		local.css.innerHTML = local.str;
		document.body.appendChild(local.css);

		// Clone the last thead tr and add class="fw0Filter"
		local.tr = $(thead).find('tr:last').clone().addClass('fw0Filter');
		// Normally every cell would be th, but <input type="checkbox" id="selectAll"> must be inside a td element.
		local.tr.find('td').empty(); // because type="checkbox" doesn't work inside a th element.
		// For the newly cloned tr, remove class="fw0Sortable" and fill it with non-breaking spaces.
		local.tr.find('th').each(function(index, element) {
			$(this).removeClass('fw0Sortable').html('&nbsp;');
		});
		$(thead).append(local.tr); // Add the newly cloned row to the thead
	});
	
	$(document).on('keyup','tr.fw0Filter input',filterKeyUp);
	function filterKeyUp(myEvent) {
		var local = {};
		local.column = $(this).closest('th').index();
		local.searchVal = $(this).val();
		local.lessThan = false;
		local.lessThanOrEqualTo = false;
		local.greaterThan = false;
		local.greaterThanOrEqualTo = false;
		local.NotEqualTo = false;
		local.hasClassNum = $(this).closest('th').hasClass('num');
		local.and = false;
		local.or = false;
		local.regex = false;
		local.key = myEvent.which; // not used.
		if (local.hasClassNum) {
			if (local.searchVal.substr(0,2) == '<=') {
				local.searchVal = local.searchVal.substr(2,99);
				local.lessThanOrEqualTo = true;
			}
			if (local.searchVal.substr(0,2) == '>=') {
				local.searchVal = local.searchVal.substr(2,99);
				local.greaterThanOrEqualTo = true;
			}
			if (local.searchVal.substr(0,2) == '<>') {
				local.searchVal = local.searchVal.substr(2,99);
				local.NotEqualTo = true;
			}
			if (local.searchVal.substr(0,1) == '<') {
				local.searchVal = local.searchVal.substr(1,99);
				local.lessThan = true;
			}
			if (local.searchVal.substr(0,1) == '>') {
				local.searchVal = local.searchVal.substr(1,99);
				local.greaterThan = true;
			}
		} else if (local.searchVal.indexOf('&') > -1) {
			local.searchVal = local.searchVal.toUpperCase();
			local.and = local.searchVal.length;
			if (local.searchVal.substr(local.and-1,1) == '&') { // if & is the key that was just typed, then remove it from the search string
				local.searchVal = local.searchVal.substr(0,local.and-1);
			}
			local.arr = local.searchVal.split('&');
		} else if (local.searchVal.indexOf('|') > -1) {
			local.searchVal = local.searchVal.toUpperCase();
			local.or = local.searchVal.length;
			if (local.searchVal.substr(local.or-1,1) === '|') { // if | is the key that was just typed, then remove it from the search string
				local.searchVal = local.searchVal.substr(0,local.or-1);
			}
			local.arr = local.searchVal.split('|');
		} else if (local.searchVal.indexOf('/') === 0) {
			if (local.searchVal.length > 1) {
				local.searchVal = ''; // Don't search until they at least have something in there other than a slash.
			} else {
				local.regex = local.searchVal.substr(1);
				local.lastCharacter = local.regex.substr(local.regex.length-1);
				if (local.lastCharacter === '/') { // if the character they just typed was a slash
					local.regex = local.regex.substr(0,local.regex.length-1); // then strip it
				}
				local.regex = new RegExp(local.regex);
			}
		}
		$('.fw0Hidden').removeClass('fw0Hidden');
		if (local.searchVal) {
			$(this).closest('table').find('tbody tr').each(function(index, row) {
				var myText = $(row).children('td:eq(' + local.column + ')').text();
				if (local.hasClassNum) {
					myText = myText.replace(/,/g , ''); // Remove commas if class="num"
					myText = parseFloat(myText);
				}
				if (local.lessThan) {
					if (myText >= local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.greaterThan) {
					if (myText <= local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.greaterThanOrEqualTo) {
					if (myText < local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.lessThanOrEqualTo) {
					if (myText > local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.NotEqualTo) {
					if (myText == local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.hasClassNum) {
					if (myText != local.searchVal) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.and) {
					myText = myText.toUpperCase();
					local.hide = false;
					for (var i=0; i < local.arr.length; i++) {
						if (myText.indexOf(local.arr[i]) === -1) { // not found
							local.hide = true;
						}
					}
					if (local.hide) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.or) {
					myText = myText.toUpperCase();
					local.hide = true;
					for (var i=0; i < local.arr.length; i++) {
						if (myText.indexOf(local.arr[i]) > -1) { // is found
							local.hide = false;
						}
					}
					if (local.hide) {
						$(row).addClass('fw0Hidden');
					}
				} else if (local.regex) {
					if (!local.regex.test(myText)) { // Regular Expressions FTW!
						$(row).addClass('fw0Hidden');
					}
				} else {
					myText = myText.toUpperCase();
					if (myText.indexOf(local.searchVal) === -1) { // not found
						$(row).addClass('fw0Hidden');
					}
				}
			});
		}
	}

	// If you click anywhere in a thead element, don't fire the clearFilter event.
	$(document).on('click','thead',stopProp);
	function stopProp(myEvent) {
		myEvent.stopPropagation();
	}
	// If they click on glyphicon-filter, don't bubble up and pretend you didn't blur, 
	$(document).on('click','.glyphicon-filter',glyphiconFilterClicked);
	function glyphiconFilterClicked(myEvent) {
		var local = {};

		myEvent.stopPropagation(); // Otherwise the cell will get replaced with a new input element.
		clearTimeout(Variables.blurTimeout); // After 100 ms, we would clear all the th elements
		
		local.th = $(this).closest('th');
		local.arr = [];
		$(this).closest('table').find('tbody > tr').each(function() {
			var found = false;
			var text = $(this).children('td:eq(' + local.th.index() + ')').text();
			for (var i=0; i< local.arr.length; i++) {
				if (local.arr[i] == text) {
					found = true;
				}
			}
			if (!found) {
				local.arr[local.arr.length] = text;
			}
		});
		Variables.hasClassNum = local.th.hasClass('num'); // used in the sort
		local.arr = local.arr.sort(sortAsc);
		local.str  = '<div id="fw0Popup">';
		// local.str += '<div><button class="close" type="button">&times;</button></div>';
		local.str += '<table ';
		local.str += ' id="fw0GroupBy"';
		local.str += ' class="table table-bordered table-hover table-condensed"';
		local.str += ' data-theadid="' + $(this).closest('thead').attr('id') + '"';
		local.str += ' data-column=' + local.th.index();
		local.str += '>';
		local.str += '<thead>';
		local.str += '<tr><th class="fw0Sortable num">&#10004;</th>';
		if (Variables.hasClassNum) {
			local.str += '<th class="fw0Sortable num">';
		} else {
			local.str += '<th class="fw0Sortable">';
		}
		local.str += local.th.parents('table').find('th').eq(local.th.index()).html();
		local.str += '</th>';
		local.str += '</tr>';
		local.str += '</thead>';
		local.str += '<tbody>';
		if (local.th.hasClass('num')) {
			for (var i=0; i<local.arr.length; i++) {
				local.str += '<tr><td class="num">&#10003;</td><td class="num">' + local.arr[i] + '</td></tr>';
			}
		} else {
			for (var i=0; i<local.arr.length; i++) {
				local.str += '<tr><td class="num">&#10003;</td><td>' + local.arr[i] + '</td></tr>';
			}
		}
		local.str += '</tbody>';
		local.str += '</table>';
		local.str += '</div>';
		$('#fw0Popup').remove();
		$('body').prepend(local.str);
	}
	function sortAsc(A,B) {
		var local = {};
		
		if (Variables.hasClassNum) {
			local.a = A.replace(/,/g , '');
			local.b = B.replace(/,/g , '');
			return local.a - local.b;
		}
		if (A < B) return -1;
		if (A > B) return 1;
		return 0;
	}
	

	// $(document).on('blur','tr.fw0Filter input',filterBlurred);
//	function filterBlurred() {
//		Variables.filterVal = $(this).val();
//		Variables.blurTimeout = setTimeout(clearFilter,100); // in 100 milliseconds
//	}
	$(document).on('click',clearFilter);
	function clearFilter() {
		if ($('tr.fw0Filter input').length && $('tr.fw0Filter input').val() === '') {
			$('tr.fw0Filter th').html('&nbsp;');
			$('#fw0Popup').remove();
			$('.fw0Hidden').removeClass('fw0Hidden');
		}
	}
	// If you click inside the fw0Filter row then clear all the th elements out, remove the filter and insert an input.
	$(document).on('click','tr.fw0Filter th',filter);
	function filter(myEvent) {
//		myEvent.stopPropagation();
		clearFilter(); // before adding the new filter.
		$(this).html('<div class="input-group"><input class="form-control"><span class="btn input-group-addon glyphicon glyphicon-filter"> </span></div>');
		$(this).find('.form-control').focus();
	}
	
})();

(function() {
	// When any part of a row is clicked inside the fw0GroupBy div, then 
	$(document).on('click','#fw0GroupBy tbody tr',trClicked);
	function trClicked(myEvent) {
		var local = {};

		myEvent.stopPropagation(); // otherwise the table would disappear
		local.theadID = $(this).closest('table').data('theadid'); // The thead that caused this div to be created.
		local.column = $(this).closest('table').data('column'); // The column number
		local.filterText = $(this).children(':eq(1)').text();
		local.table = $('#' + local.theadID).closest('table');
		if ($(this).find(':first-child').text().charCodeAt(0) === 10003) { // unicode check
			$(this).find(':first-child').empty(); // remove the check
			// Now hide the ones that are equal.
			local.table.find('tbody > tr').each(function(index, tr) {
				var myText = $(tr).children('td:eq(' + local.column + ')').text();
				if (myText === local.filterText) {
					$(this).addClass('fw0Hidden');
				}
			});
		} else {
			$(this).find(':first-child').html('&#10003;');
			// Now show the ones that are equal.
			local.table.find('tbody > tr').each(function(index, tr) {
				var myText = $(tr).children('td:eq(' + local.column + ')').text();
				if (myText === local.filterText) {
					$(this).removeClass('fw0Hidden');
				}
			});
		}
	}
})();

(function() {
	// When the checkmark inside the fw0GroupBy div table thead th is clicked
	$(document).on('click','#fw0GroupBy th:first',thClicked);
	function thClicked(myEvent) {
		var local = {};
		
		local.theadID = $(this).closest('table').data('theadid'); // The thead that caused this div to be created.
		local.table = $('#' + local.theadID).closest('table');
		if ($(this).text().charCodeAt(0) === 10004) { // unicode heavy check, not just a normal check
			$(this).html('&nbsp;');
			$(this).closest('table').find('tbody > tr td:first-child').empty(); // remove the check marks from all the rows.
			local.table.find('tbody > tr').addClass('fw0Hidden');
		} else {
			$(this).html('&#10004');
			$(this).closest('table').find('tbody > tr td:first-child').html('&#10003');
			$('.fw0Hidden').removeClass('fw0Hidden');
		}
	}
})();
