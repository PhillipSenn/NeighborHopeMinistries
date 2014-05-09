<!DOCTYPE html>
<html lang="en">
<head>
<cfoutput>
<meta charset="utf-8">
<meta content="Phillip Senn" name="author">
<cfif request.fw.css>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/fw/fw.css">
	<cfif IsDefined('request.fw.jQueryUI')>
		<!-- black-tie,blitzer,cupertino,dark-hive,dot-luv,eggplant,excite-bike,flick,hot-sneaks,humanity,le-frog,mint-choc,overcast,pepper-grinder,redmond,smoothness,south-street,start,sunny,swanky-purse,trontastic,ui-darkness,ui-lightness,vader -->
		<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1/themes/#request.fw.jQueryUI#/jquery-ui.css">
	</cfif>
</cfif>
<cfif request.fw.js>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
</cfif>
</cfoutput>
