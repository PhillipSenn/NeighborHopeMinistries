<cfscript>
request.fw.log.db = false
if (StructKeyExists(url,"LogCFID")) {
	LogCF = new com.LogCF().Read(url);
} else {
	LogCF = new LogCF().Top1000();
}
StructDelete(request,"Bootstrap");
SaveDate = "";
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">LogCF</th>
			<th class="num">User</th>
			<th class="num">Sort</th>
			<th class="num">Elapsed</th>
			<th class="num">Output</th>
			<th>Query<br>String</th>
			<th>Script Name</th>
			<th class="num">User<br>Agent</th>
			<th>URL<br>Scope</th>
			<th class="num">Form<br>length</th>
			<th class="num">Session<br>length</th>
			<th class="num">Date</th>
			<th class="num">Time</th>
			<th>Remote<br>Address</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="LogCF.qry">
			<tr>
				<td class="num">#LogCFID#</td>
				<td class="num" title="#Email#">#PersonID#</td>
				<td class="num">
					<cfif LogCFSort>
						#LogCFSort#
					</cfif>
				</td>
				<td class="num">
					<cfif LogCFElapsed>
						#LogCFElapsed#
					</cfif>
				</td>
				<td class="num">
					<cfif Len(LogCFOutString)>
						<a href="OutString.cfm?LogCFID=#LogCFID#">#Len(LogCFOutString)#</a>
					</cfif>
				</td>
				<td>#LogCFQueryString#</td>
				<td>#LogCFName#</td>
				<td class="num">
					<cfif Len(LogCFUserAgent)>
						<a href="UserAgent.cfm?LogCFID=#LogCFID#">#Len(LogCFUserAgent)#</a>
					</cfif>
				</td>
				<td>#LogCFURL#</a></td>
				<td class="num">
					<cfif Len(LogCFForm)>
						<a href="Form.cfm?LogCFID=#LogCFID#">#Len(LogCFForm)#</a>
					</cfif>
				</td>
				<td class="num">
					<cfif Len(LogCFSession)>
						<a href="Session.cfm?LogCFID=#LogCFID#">#Len(LogCFSession)#</a>
					</cfif>
				</td>
				<td class="num">
					<cfif SaveDate NEQ DateFormat(LogCFDateTime,"mm/dd")>
						<cfset SaveDate = DateFormat(LogCFDateTime,"mm/dd")>
						#SaveDate#
					</cfif>
				</td>
				<td class="num monospace">#TimeFormat(LogCFDateTime,"H:mm:ss.lll")#</td>
				<td>#RemoteAddr#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>