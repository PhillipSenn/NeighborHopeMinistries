<cfscript>
if (StructKeyExists(url,"LogCFErrID")) {
	LogCFErr = new com.LogCFErr().Read(url);
} else {
	LogCFErr = new LogCFErr().Top1000();
}
StructDelete(request,"Bootstrap");
SaveDate = '';
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">CFErr</th>
			<th class="num">User</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th class="num">ColdFusion<br>Page</th>
			<th class="num">Number</th>
			<th class="num">Line</th>
			<th>Message</th>
			<th>ErrName</th>
			<th>Detail</th>
			<th>Type</th>
			<th>Event<br>Name</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogCFErr.qry">
			<tr>
				<td class="num">#LogCFErrID#</td>
				<td class="num" title="#UsrName#">#UsrID#</td>
				<td class="num">
					<cfif LogCFErrSort>
						#LogCFErrSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogCFErrElapsed>
						#LogCFErrElapsed#
					</cfif>
				</td>
				<td class="num"><a href="../LogCF/LogCF.cfm?LogCFID=#LogCFID#">#LogCFID#</a></td>
				<td class="num">
					<cfif LogCFErrNumber>
						#LogCFErrNumber#
					</cfif>
				</td>
				<td class="num">
					<cfif LogCFErrLine>
						#LogCFErrLine#
					</cfif>
				</td>
				<td>#LogCFErrMessage#</td>
				<td>#LogCFErrName#</td>
				<td>#LogCFErrDetail#</td>
				<td>#LogCFErrType#</td>
				<td>#LogCFErrEventName#</td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogCFErrDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogCFErrDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogCFErrDateTime,"h:nn:ss:llltt")#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>