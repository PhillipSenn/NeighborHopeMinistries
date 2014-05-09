<cfscript>
response = new com.MetaData.ErrorCodes().Where()
// response = CreateObject("component","com.MetaData.ErrorCodes").Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfif IsDefined("response.qry")>
	<h1>GetErrorCodes</h1>
	<table>
	<thead>
		<tr>
			<th class="num">ErrorCodeID</th>
			<th>Message</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#ErrorCodeID#</td>
			<td>#Message#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
	<div id="recordCount">
		RecordCount: #response.qry.recordCount#.
	</div>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>