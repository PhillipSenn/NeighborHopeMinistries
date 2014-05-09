<cfscript>
Usr = new com.Usr().Where();
request.fw0.Container = false;
</cfscript>
<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<div class="col-md-2">
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogCF"> LogCF </a> </h4>
			</div>
			<div id="LogCF" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							UsrID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							OutString </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							QueryString </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Cookies </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							UserAgent </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							URL </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Form </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Session </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							RemoteAddr </label>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogCFC"> LogCFC </a> </h4>
			</div>
			<div id="LogCFC" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFCID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Desc </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogCFErr"> LogCFErr </a> </h4>
			</div>
			<div id="LogCFErr" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFErrID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Number </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Line </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Detail </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Message </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Type </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							EventName </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogDB"> LogDB </a> </h4>
			</div>
			<div id="LogDB" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							ComponentName </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							FunctionName </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							RecordCount </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							ExecutionTime </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							RemoteAddr </label>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogDBErr"> LogDBErr </a> </h4>
			</div>
			<div id="LogDBErr" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogDBID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Desc </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							ErrCode </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							SQLState </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Type </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogJS"> LogJS </a> </h4>
			</div>
			<div id="LogJS" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogJSID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Desc </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							PathName </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##LogUI"> LogUI </a> </h4>
			</div>
			<div id="LogUI" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogUIID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							LogCFID </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Elapsed </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Tag </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							TagName </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Identifier </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Class </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Destination </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Value </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							DateTime </label>
					</div>
				</div>
			</div>
		</div>

<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title"> <a data-toggle="collapse" data-parent="##accordion" href="##Usr"> Usr </a> </h4>
			</div>
			<div id="Usr" class="panel-collapse collapse in">
				<div class="panel-body">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							UsrID </label>
					</div>
					<div class="checkbox">
						<label>
							<input id="UsrName" type="checkbox" checked>
							Name </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							Sort </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							isAdmin </label>
					</div>
					<div class="checkbox">
						<label>
							<input type="checkbox">
							FrameworkZeroID </label>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<div class="col-md-10">
	<table>
		<thead>
			<tr>
				<th class="num">Row</th>
				<th>UsrName</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="Usr.qry">
				<tr>
					<td class="num">#CurrentRow#</td>
					<td>#UsrName#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
