<cfscript>
if (IsDefined('form.Save')) {
	h1 = 'CheckLogin #form.UserID#, #form.UserSessionID#'
	response = new Login().CheckLogin(form)
} else if (IsDefined('session.UserID')) {
	h1 = 'CheckLogin #session.UserID#, #session.UserSessionID#'
	response = new Login().CheckLogin(session)
} else {
	h1 = 'UserID must be defined first.'
	response=''
}
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
Check Login Status (non-destructive method of checking the authentication status of the current userID & UserSessionID <br>
<h1>#h1#</h1>
<cfdump var="#response#">
	<form method="post">
		<label for="UserID">UserID:</label>
		<input name="UserID" value="#session.UserID#" autofocus>
		<label for="UserSessionID">UserSessionID:</label>
		<input name="UserSessionID" value="#session.UserSessionID#">
		<p>
			<button name="Save" type="submit">Try it!</button>
		</p>
	</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>