<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<ul>
	<li><a href="msg.cfm">We catch it and can continue processing (showing a msg)</a></li>
	<li><a href="myError.cfm">We catch it but can't continue processing (onError)</a></li>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>