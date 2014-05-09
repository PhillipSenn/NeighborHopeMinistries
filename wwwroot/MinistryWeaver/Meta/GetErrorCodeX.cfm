<cfscript>
response = new com.MetaData.ErrorCodes().GetErrorCodeX()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetErrorCodeX</h1>
This shows what happens if there is an unforseen circumstance
such as the application developer misspelling the stored procedure name.
<cfif IsDefined("response.qry")>
	<table>
	<cfloop query="response.qry">
		<tr>
			<td>#ErrorCodeID#</td>
			<td>#Message#</td>
		</tr>
	</cfloop>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>