<cfscript>
LastName = new com.LastName().Where();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<cfloop query="LastName.qry">
		<tr>
			<td>#LastName#</td>
		</tr>
	</cfloop>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>