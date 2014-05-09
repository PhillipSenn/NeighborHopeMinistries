(function() {
	var Variables = {};


	$('thead').not('.no-sort').find('th').not('.no-sort').addClass('fw0Sortable').each(function(index, element) {
		var local = {};
		
		// Determine if each column is presorted
		local.column = $(this).index();
		local.table = $(this).closest('table');
		local.firstRow = local.table.find('tbody > tr:first-child');
		local.firstCell = local.firstRow.children('td:eq(' + local.column + ')');
		local.asc = local.firstCell.text();
		local.desc = local.asc;
		local.showUnicode = false;
		local.ascending = true; // The entire row is in ascending order.
		local.descending= true; // The entire row is in descening order.
		local.hasClassDate = $(this).hasClass('date');
		local.hasClassNum = $(this).hasClass('num');
		$(this).closest('table').find('tbody > tr').each(function(index, row) {
			var text = $(row).children('td:eq(' + local.column + ')').text();
			if (local.hasClassNum) {
				text = text.replace(/,/g ,'');
				text = parseFloat(text);
			} else {
				text = $.trim(text);
			}
			if (local.hasClassDate) {
				text = $(row).children('td:eq(' + local.column + ')').data('date') || text;
			}
			if (text > local.asc) {
				local.showUnicode = true;
				local.asc = text;
			} else if (text = local.asc) {
			} else {
				local.ascending = false;
				return false;
			}
		});	
		$(this).closest('table').find('tbody > tr').each(function(index, row) {
			var text = $(row).children('td:eq(' + local.column + ')').text();
			if (local.hasClassNum) {
				text = text.replace(/,/g ,'');
				text = parseFloat(text);
			} else {
				text = $.trim(text);
			}
			if (local.hasClassDate) {
				text = $(row).children('td:eq(' + local.column + ')').data('date') || text;
			}
			if (text <= local.desc) {
				local.desc = text;
			} else {
				local.descending = false;
				return false;
			}
		});
		if ($(this).hasClass('no-init')) { // Don't show the initial unicode even if the column is presorted.
			$(this).html($(this).html() + '<span class="fw0Unicode">&nbsp;</span>');
		} else if (local.ascending && local.showUnicode) {
			$(this).addClass('fw0Ascending').html($(this).html() + '<span class="fw0Unicode">&#9650;</span>'); // http://www.charbase.com/25b3-unicode-white-up-pointing-triangle
		} else if (local.descending && local.showUnicode) {
			$(this).addClass('fw0Descending').html($(this).html() + '<span class="fw0Unicode">&#9660;</span>'); // http://www.charbase.com/25bc-unicode-black-down-pointing-triangle
		} else {
			$(this).html($(this).html() + '<span class="fw0Unicode">&nbsp;</span>');
		}
	});;
	$(document).on('click','th a',thaClicked);
	function thaClicked(myEvent) {
		myEvent.stopPropagation();
	}
	$(document).on('click','th.fw0Sortable',thSortable); // Whenever any th.fw0Sortable is clicked
	function thSortable() {
		var local = {};

		local.th = $(this);
		Variables.Table = local.th.closest('table');
		Variables.Column = local.th.index();
		Variables.hasClassNum  = local.th.hasClass('num');
		Variables.hasClassDate = local.th.hasClass('date');
		local.rows = Variables.Table.find('tbody > tr');
		
		local.hadClassAscending = local.th.hasClass('fw0Ascending');

		local.th.closest('tr').find('th').removeClass('fw0Descending fw0Ascending').find('.fw0Unicode').empty();
		if (local.hadClassAscending) {
			local.th.addClass('fw0Descending').find('.fw0Unicode').html('&#9660;');
			local.rows.sort(sortDesc);
		} else {
			local.th.addClass('fw0Ascending').find('.fw0Unicode').html('&#9650;');
			local.rows.sort(sortAsc);
		}
		$.each(local.rows,appendMe);
	}
	function sortAsc(rowA,rowB) {
		var local = {};
		
		local.a = $(rowA).children('td:eq(' + Variables.Column + ')').text();
		local.b = $(rowB).children('td:eq(' + Variables.Column + ')').text();
		local.a = $.trim(local.a); // probably not necessary
		local.b = $.trim(local.b); // probably not necessary
		if (Variables.hasClassDate) {
			local.a = $(rowA).children('td:eq(' + Variables.Column + ')').data('date') || local.a;
			local.b = $(rowB).children('td:eq(' + Variables.Column + ')').data('date') || local.b;
			return local.a - local.b;
		}
		if (Variables.hasClassNum) {
			local.a = local.a.replace(/,/g ,''); // strip commas
			local.b = local.b.replace(/,/g ,''); // strip commas
			return local.a - local.b;
		}
		if (local.a < local.b) return -1;
		if (local.a > local.b) return 1;
		return 0;
	}
	function sortDesc(rowA,rowB) {
		return -sortAsc(rowA,rowB);
		/*
		var local = {};
		
		local.a = $(rowA).children('td:eq(' + Variables.Column + ')').text();
		local.b = $(rowB).children('td:eq(' + Variables.Column + ')').text();
		if (Variables.hasClassNum) return local.b - local.a;
		if (local.a < local.b) return 1;
		if (local.a > local.b) return -1;
		return 0;
		*/
	}
	function appendMe(index, row) {
		Variables.Table.children('tbody').append(row);
	}
})();

(function() {
	var Variables = {};
	
	Variables.sortColumn = 0;
	$(document).on('click','.fw0Unicode',unicodeClicked);
	function unicodeClicked(myEvent) {
		var local = {};
		myEvent.stopPropagation(); // Don't toggle the sort order
		if ($(this).hasClass('locked')) {
			$(this).removeAttr('title').removeClass('locked');
		} else {
			Variables.sortColumn += 1;
			$(this).attr('title',Variables.sortColumn).addClass('locked');
		}
		// Now resort the column titles 1,2,3...
		local.str = '';
		$(this).closest('tr').find('th').each(function(index, element) {
			var Unicode = $(this).find('.fw0Unicode');
			
			if (Unicode.hasClass('locked')) {
				local.str += Unicode.attr('title') + ',';
			}
		});
		local.arr = local.str.split(',');
		local.arr.sort();
				debugger;
		Variables.sortColumn = 0;
		for (var i=1; i<local.arr.length; i++) { // skip the first arr element because local.str ended with a comma.
			Variables.sortColumn += 1;
			// find the th that has title=
			$(this).closest('tr').find('th').each(function(index, element) {
				var Unicode = $(this).find('.fw0Unicode');
				if (Unicode.attr('title') == local.arr[i]) {
					Unicode.attr('title',Variables.sortColumn);
				}
			});
		}
	}
})();
