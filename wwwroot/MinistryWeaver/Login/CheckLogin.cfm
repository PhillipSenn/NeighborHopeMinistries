<cfscript>
if (IsDefined('form.Save')) {
	h1 = 'CheckLogin #form.UserID#, #form.UserSessionID#'
	response = new Login().CheckLogin(form) // form.UserID, form.UserSessionID
} else if (IsDefined('session.User.UserID')) {
	h1 = 'CheckLogin #session.User.UserID#, #session.User.UserSessionID#'
	response = new Login().CheckLogin(session.User) // session.User.UserID, session.User.UserSessionID
} else {
	h1 = 'Must be logged in.'
	response=''
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
Check Login Status (non-destructive method of checking the authentication status of the current userID & UserSessionID <br>
<h1>#h1#</h1>
<cfif IsDefined('response.Prefix')>
	<table>
		<tbody>
		<tr>
			<td>ReturnCode</td>
			<td class="num">#response.Prefix.StatusCode#</td>
		</tr>
		</tbody>
	</table>
</cfif>
<form method="post">
	But what happens when you submit and invalid UserID/UserSessionID combination?
	<label for="UserID">UserID:</label>
	<input name="UserID" value="#session.User.UserID#" autofocus>
	<label for="UserSessionID">UserSessionID:</label>
	<input name="UserSessionID" value="#session.User.UserSessionID#">
	<p>
		<button name="Save" type="submit">Try it!</button>
	</p>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>