<cfoutput>
<cfinclude template="/fw/html.cfm">
<title>#Application.fw.Name#</title>
<cfif request.fw.css>
	<link rel="stylesheet" href="/Inc/html.css">
</cfif>
</cfoutput>