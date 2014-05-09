
<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<p><a href="LogDBErr.cfm">See the DBErr log</a></p>
<cfscript>
new Fail().TableNotFound();
</cfscript>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>