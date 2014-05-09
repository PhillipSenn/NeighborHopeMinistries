(function() {
	var Variables = {};
	Variables.theadID = 0;

	// For every thead
	$('thead').not('.no-filter').each(function(index, thead) {
		var local = {};
		
		if ($(thead).attr('id')) {
			// We'll use the exising id
		} else {
			// We'll assign a unique id
			Variables.theadID += 1;
			$(thead).attr('id','fwThead' + Variables.theadID);
		}
		// Set the max-width for each column via css.
		local.str = '';
		$('th',this).each(function(index, element) { // for every th inside of every thead
			if (!$(this).hasClass('no-filter')) {
				local.str += 'tr.fwFilter th:nth-child(' + (index+1) + ') {';
				local.str += '	max-width:' + $(this).width() + 'px;';
				local.str += '}';
			}
		});
		// todo: this won't work for multiple theads.  I'll have to add a unique class to each one.
		local.css = document.createElement("style");
		local.css.type = "text/css";
		local.css.innerHTML = local.str;
		document.body.appendChild(local.css);

		// Clone the last thead tr and add class="fwFilter"
		local.tr = $(thead).find('tr:last').clone().addClass('fwFilter');
		// Normally every cell would be th, but <input type="checkbox" id="selectAll"> must be inside a td element.
		local.tr.find('td').empty(); // because type="checkbox" doesn't work inside a th element.
		// For the newly cloned tr, remove class="fwSortable" and fill it with non-breaking spaces.
		local.tr.find('th').each(function(index, element) {
			$(this).removeClass('fwSortable').html('&nbsp;');
		});
		$(thead).append(local.tr); // Add the newly cloned row to the thead
	});
	

	// If you click on the (newly created) input field, then don't bubble up because that would clear everything in the row and start over again.
	$(document).on('click','tr.fwFilter input',filterClick);
	function filterClick(myEvent) {
		myEvent.stopPropagation();
	}
	
	$(document).on('keyup','tr.fwFilter input',filterKeyUp);
	function filterKeyUp() {
		var local = {};
		local.column = $(this).closest('th').index();
		local.searchVal = $(this).val().toUpperCase();
		local.lessThan = false;
		local.lessThanOrEqualTo = false;
		local.greaterThan = false;
		local.greaterThanOrEqualTo = false;
		local.NotEqualTo = false;
		local.hasClassNum = $(this).closest('th').hasClass('num');
		local.and = false;
		local.or = false;
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
			local.and = local.searchVal.length;
			if (local.searchVal.substr(local.and-1,1) == '&') { // if & is the key that was just typed, then remove it from the search string
				local.searchVal = local.searchVal.substr(0,local.and-1);
			}
			local.arr = local.searchVal.split('&');
		} else if (local.searchVal.indexOf('|') > -1) {
			local.or = local.searchVal.length;
			if (local.searchVal.substr(local.or-1,1) == '|') { // if | is the key that was just typed, then remove it from the search string
				local.searchVal = local.searchVal.substr(0,local.or-1);
			}
			local.arr = local.searchVal.split('|');
		}
		$('.fwHidden').removeClass('fwHidden');
		if (local.searchVal) {
			$(this).closest('table').find('tbody tr').each(function(index, row) {
				var myText = $(row).children('td:eq(' + local.column + ')').text();
				if (local.hasClassNum) {
					myText = myText.replace(/,/g , ''); // Remove commas if class="num"
					myText = parseFloat(myText);
				} else {
					myText = $.trim(myText.toUpperCase());
				}
				if (local.lessThan) {
					if (myText >= local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.greaterThan) {
					if (myText <= local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.greaterThanOrEqualTo) {
					if (myText < local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.lessThanOrEqualTo) {
					if (myText > local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.NotEqualTo) {
					if (myText == local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.hasClassNum) {
					if (myText != local.searchVal) {
						$(row).addClass('fwHidden');
					}
				} else if (local.and) {
					local.hide = false;
					for (var i=0; i < local.arr.length; i++) {
						if (myText.indexOf(local.arr[i]) === -1) { // not found
							local.hide = true;
						}
					}
					if (local.hide) {
						$(row).addClass('fwHidden');
					}
				} else if (local.or) {
					local.hide = true;
					for (var i=0; i < local.arr.length; i++) {
						if (myText.indexOf(local.arr[i]) > -1) { // is found
							local.hide = false;
						}
					}
					if (local.hide) {
						$(row).addClass('fwHidden');
					}
				} else if (myText.indexOf(local.searchVal) === -1) { // not found
					$(row).addClass('fwHidden');
				}
			});
		}
	}

	// If they click on glyphicon-filter, don't bubble up and pretend you didn't blur, 
	Variables.filterPromise = $.Deferred();
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
		local.str  = '<div id="fwPopup">';
		// local.str += '<div><button class="close" type="button">&times;</button></div>';
		local.str += '<table ';
		local.str += ' id="fwGroupBy"';
		local.str += ' class="table table-bordered table-hover table-condensed"';
		local.str += ' data-theadid="' + $(this).closest('thead').attr('id') + '"';
		local.str += ' data-column=' + local.th.index();
		local.str += '>';
		local.str += '<thead>';
		local.str += '<tr><th class="num">&#10004;</th>';
		if (Variables.hasClassNum) {
			local.str += '<th class="num">';
		} else {
			local.str += '<th>';
		}
		local.str += local.th.parents('table').find('th').eq(local.th.index()).text();
		local.str += '</th>';
		local.str += '</tr>';
		local.str += '</thead>';
		local.str += '<tbody>';
		if (local.th.hasClass('num')) {
			for (var i=0; i<local.arr.length; i++) {
				local.str += '<tr><td class="num">&#10004;</td><td class="num">' + local.arr[i] + '</td></tr>';
			}
		} else {
			for (var i=0; i<local.arr.length; i++) {
				local.str += '<tr><td class="num">&#10004;</td><td>' + local.arr[i] + '</td></tr>';
			}
		}
		local.str += '</tbody>';
		local.str += '</table>';
		local.str += '</div>';
		$('#fwPopup').remove();
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
	

	// $(document).on('blur','tr.fwFilter input',filterBlurred);
//	function filterBlurred() {
//		Variables.filterVal = $(this).val();
//		Variables.blurTimeout = setTimeout(clearFilter,100); // in 100 milliseconds
//	}
	$(document).on('click',clearFilter);
	function clearFilter() {
		if ($('tr.fwFilter input').length && $('tr.fwFilter input').val() === '') {
			$('tr.fwFilter th').html('&nbsp;');
			$('#fwPopup').remove();
			$('.fwHidden').removeClass('fwHidden');
		}
	}
	// If you click inside the fwFilter row then clear all the th elements out, remove the filter and insert an input.
	$(document).on('click','tr.fwFilter th',filter);
	function filter(myEvent) {
		myEvent.stopPropagation();
		clearFilter(); // before adding the new filter.
		$(this).html('<div class="input-group"><input class="form-control"><span class="btn input-group-addon glyphicon glyphicon-filter"> </span></div>');
		$(this).find('.form-control').focus();
	}
	
})();

(function() {
	// When any part of a row is clicked inside the fwGroupBy div, then 
	$(document).on('click','#fwGroupBy tr',trClicked);
	function trClicked(myEvent) {
		var local = {};

		myEvent.stopPropagation(); // otherwise the table would disappear
		local.theadID = $(this).closest('table').data('theadid'); // The thead that caused this div to be created.
		local.column = $(this).closest('table').data('column'); // The column number
		local.filterText = $(this).children(':eq(1)').text();
		local.table = $('#' + local.theadID).closest('table');
		if ($(this).find(':first-child').text().charCodeAt(0) === 10004) { // unicode check
			$(this).find(':first-child').empty(); // remove the check
			// Now hide the ones that are equal.
			local.table.find('tbody > tr').each(function(index, tr) {
				var myText = $(tr).children('td:eq(' + local.column + ')').text();
				if (myText === local.filterText) {
					$(this).addClass('fwHidden');
				}
			});
		} else {
			$(this).find(':first-child').html('&#10004;');
			// Now show the ones that are equal.
			local.table.find('tbody > tr').each(function(index, tr) {
				var myText = $(tr).children('td:eq(' + local.column + ')').text();
				if (myText === local.filterText) {
					$(this).removeClass('fwHidden');
				}
			});
		}
	}
})();

