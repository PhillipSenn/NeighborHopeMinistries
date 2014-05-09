<cfscript>
param name="request.fw.js" default=true;
param name="request.fw.css" default=true;
param name="request.fw.jQueryUI" default='ui-lightness';
</cfscript>

<!doctype html>
<html lang="en">
<head>
<cfoutput>
<meta charset="utf-8">
<meta content="Phillip Senn" name="author">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Inc/html.css">
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1/themes/#request.fw.jQueryUI#/jquery-ui.css">
</cfoutput>