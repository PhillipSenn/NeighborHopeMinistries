<cfscript>
param name="session.LiveReload.DateLastModified" default=0;
form.FileName = GetFileFromPath(cgi.SCRIPT_NAME)
form.BaseName = form.FileName
for (i=Len(form.FileName); i>0; i--) {
	if (Mid(form.FileName,i,1) == '.') {
		form.BaseName = Left(form.FileName,i-1)
		break;
	}
}
form.Query_String = cgi.QUERY_STRING
form.Query_String = Replace(form.Query_String,'?cache=1','') // todo: I'll have to take into account HHmmss.lll
form.Query_String = Replace(form.Query_String,'&cache=1','')
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1 id="CountDown">Live Reload</h1>
#TimeFormat(now(),'H:mm:ss.lll')#
What I need to do is:
<ul>
	<li>Check .js and .css files</li>
	<li>Check all dependencies</li>
	<li>Use jQuery's animate and then LiveReload on the callback</li>
</ul>

<cfinclude template="/Inc/foot.cfm">
<input type="hidden" id="Query_String" value="#form.Query_String#">
<input type="hidden" id="BaseName" value="#form.BaseName#">
<script src="LiveReload.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>