<cfscript>
param request.fw0.js	= true;
param request.fw0.css	= true;
param request.fw0.noCache = true;
param request.fw0.Bootstrap = true;
Library = "/FrameworkZero/Library/";
</cfscript>

<!doctype html>
<html lang="en" class="no-js">
<head>
<cfoutput>
<meta charset="utf-8">
<meta content="Phillip Senn" name="author">
<cfif request.fw0.noCache>
	<meta content="no-cache, no-store, must-revalidate" http-equiv="Cache-Control">
	<meta content="no-cache" http-equiv="Pragma">
	<meta content="0" http-equiv="Expires">
</cfif>
<cfif request.fw0.Bootstrap>
<meta name="viewport" content="width=device-width">
<!---
<meta name="viewport" content="width=device-width, initial-scale=1">
--->
<cfif request.fw0.css>
<link rel="stylesheet" href="#Library#fw0/html.css">
<link rel="stylesheet" href="#Application.fw0.homeDir#Inc/html.css">
</cfif>
<cfelseif request.fw0.css>
<link rel="stylesheet" href="#Library#fw0/Bootstrap0.css">
</cfif>
<cfif IsDefined("request.fw0.icons") AND request.fw0.icons>
	<link rel="stylesheet" href="#Library#fw0/icons.css">
</cfif>	
<cfif request.fw0.js>
	<script src="/Library/jQuery/jQuery.js"></script>
	<cfif IsDefined("request.fw0.jQueryUI")>
		<cfif request.fw0.css>
			<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1/themes/#request.fw0.jQueryUI#/jquery-ui.css">
		</cfif>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.js"></script>
	</cfif>
</cfif>
</cfoutput>