<cfscript>
qry = new dataTables().Top10();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="dataTables.css">
<script src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.js"></script>
<cfinclude template="/Inc/body.cfm">
<div id="fake">
	<div class="row">
		<div class="col-md-6">
			<label>
			<select class="w75">
				<option value="10">10</option>
				<option value="25">25</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select>
			records per page</label>
		</div>
		<div class="col-md-6">
			<label class="w100">Search:
			<input name="fakeSearch" id="fakeSearch">
			</label>
		</div>
	</div>
	<div class="row">
		<table>
			<thead>
				<tr>
					<th class="sort_asc num">Row&nbsp;</th>
					<th class="sort_both">Last Name</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="qry">
					<tr>
						<td class="num">#CurrentRow#</td>
						<td>#LastName#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
		<div class="fl">
			Showing 1 to 10 of 5,000 entries<br>
		</div>
		<ul class="pagination" id="fakePagination">
			<li class="prev disabled"><a href="JavaScript:;">&##8592; Previous</a></li>
			<li class="active"><a href="JavaScript:;">1</a></li>
			<li><a href="JavaScript:;">2</a></li>
			<li><a href="JavaScript:;">3</a></li>
			<li><a href="JavaScript:;">4</a></li>
			<li><a href="JavaScript:;">5</a></li>
			<li id="fakeNext" class="next"><a href="JavaScript:;">Next	&##8594;</a></li>
		</ul>
	</div>
</div>
<div id="realDiv" hidden>
	<table id="realTable">
		<thead>
			<tr>
				<th class="num">Row&nbsp;</th>
				<th>Last Name</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<ul>Todo:
	</ul>
</div>
<a href="http://datatables.net/">DataTables.net</a>
<cfinclude template="/Inc/foot.cfm">
<script src="/Library/Bootstrap/dataTables/dataTables.js"></script>
<script src="dataTables.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>