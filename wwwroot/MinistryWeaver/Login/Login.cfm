<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfdump var="#session.User#">
<cfabort>
<cfif IsDefined('session.User')>
	<table>
		<tr>
			<td>ReturnCode</td>
			<td>#session.User.Prefix.StatusCode#</td>
		</tr>
		<tr>
			<td>isAdmin</td>
			<td>#session.User.isAdmin#</td>
		</tr>
		<tr>
			<td>MustChangePassword</td>
			<td>#session.User.mustChangePassword#</td>
		</tr>
		<tr>
			<td>UserID</td>
			<td>#session.User.UserID#</td>
		</tr>
		<tr>
			<td>UserSessionID</td>
			<td>#session.User.UserSessionID#</td>
		</tr>
	</table>
	<ul>
		<li><a href="Favorites.cfm">GetFavorites</a></li>
		<li><a href="CheckLogin.cfm">Check Login</a> </li>
		<li><a href="../quickSearch/quickSearch.cfm">QuickSearch</a></li>
		<li><a href="browseObjects.cfm">Browse Objects</a></li>
		<li><a href="BrowseActivity.cfm">Browse Activity</a></li>
		<li><a href="/Login/logout.cfm">Logout</a></li>
	</ul>
<cfelse>
	<cfdump var="#session.obj#">
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>