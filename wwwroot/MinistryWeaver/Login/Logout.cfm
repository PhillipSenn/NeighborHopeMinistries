<cfscript>
new com.sproc().exec('app.logout')
StructDelete(session,"User")
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>You have been logged out</h1>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>