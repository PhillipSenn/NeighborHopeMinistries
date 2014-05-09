<cfscript>
if (IsDefined('session.UserID')) {
	response = new Login().CheckLoginX(session)
} else {
	request.fw.msg = 'UserID must be defined first.'
	response=''
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
This shows what happens when CheckLogin returns an error.  
In this case, it's missing because there is no CheckLoginX.
<cfif IsDefined('response.Prefix')>
	<table>
		<tbody>
		<tr>
			<td>ReturnCode</td>
			<td>#response.Prefix.StatusCode#</td>
		</tr>
		</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>