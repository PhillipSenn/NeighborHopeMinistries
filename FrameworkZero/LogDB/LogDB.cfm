<cfscript>
if (StructKeyExists(url,"LogDBID")) {
	LogDB = new com.LogDB().Read(url);
} else {
	LogDB = new LogDB().Top1000();
}
StructDelete(request,"Bootstrap");
SaveDate = '';
US = getPageContext().getRequest().getRemoteAddr();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<table>
	<thead>
		<tr>
			<th class="num">User</th>
			<th class="num">LogDBID</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th>Function</th>
			<th>LogDBName</th>
			<th class="num">Record<br>Count</th>
			<th class="num">Exec<br>Time</th>
			<th class="num">Date/Time</th>
			<th>IP Address</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogDB.qry">
			<tr>
				<td class="num" title="#UsrName#">
					<a href="../Usr/Usr.cfm?UsrID=#UsrID#">#UsrID#</a>
				</td>
				<td class="num">#LogDBID#</td>
				<td class="num">
					<cfif LogDBSort>
						#LogDBSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBElapsed>
						#LogDBElapsed#
					</cfif>
				</td>
				<td>
					<cfif LogDBComponentName NEQ "">
						#LogDBComponentName#()<br>
					</cfif>
					#LogDBFunctionName#
				</td>
				<td class="pre">
					<cfset Variables.LogDBName = Replace(LogDBName,'814F7845-1C3F-4F42-BD1C-4A3301AF89BF','(snip)','all')>
					#Variables.LogDBName#
				</td>
				<td class="num">
					<cfif LogDBRecordCount>
						#LogDBRecordCount#
					</cfif>
				</td>
				<td class="num">
					<cfif LogDBExecutionTime>
						#LogDBExecutionTime#ms
					</cfif>
				</td>
				<td class="num monospace">
					<cfif SaveDate NEQ DateFormat(LogDBDateTime,"mm/dd/yyyy")>
						<cfset SaveDate = DateFormat(LogDBDateTime,"mm/dd/yyyy")>
						#SaveDate# <br>
					</cfif>
					#TimeFormat(LogDBDateTime,"h:nn:ss:llltt")#
				</td>
				<cfif RemoteAddr EQ US>
					<td title="#us#">
						us
					</td>
				<cfelseif RemoteAddr EQ "204.12.49.139">
					<td title="#RemoteAddr#">VPS</td>
				<cfelse>
					<td>#RemoteAddr#</td>
				</cfif>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>