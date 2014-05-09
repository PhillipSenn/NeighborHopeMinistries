<cfscript>
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<ul>
	<li><a href="Meta/GetErrorCodes.cfm">GetErrorCodes</a></li>
	<li><a href="Meta/GetErrorCodeX.cfm">GetErrorCodeX</a></li>
	<li><a href="Meta/GetMetaDataAssociations.cfm">GetMetaDataAssociations</a></li>
	<li><a href="Meta/GetMetaDataAttributes.cfm">GetMetaDataAttributes</a></li>
	<li><a href="Meta/getMetaDataBrowseSort.cfm">getMetaDataBrowseSort</a></li>
	<li><a href="Meta/GetMetaDataClassForm.cfm">GetMetaDataClassForm</a></li>
	<li><a href="Meta/GetMetaDataClassTree.cfm">GetMetaDataClassTree</a></li>
	<li><a href="Meta/GetMetaDataForms.cfm">GetMetaDataForms</a></li>
	<li><a href="Meta/GetMetaDataObjectValidStates.cfm">GetMetaDataObjectValidStates</a></li>
	<li><a href="Meta/GetMetaDataRegionTree.cfm">GetMetaDataRegionTree</a></li>
	<li><a href="Meta/GetMetaDataStates.cfm">GetMetaDataStates</a></li>
	<cfif IsDefined('session.User')>
		<li><a href="Login/Login.cfm">More</a></li>
	<cfelse>
		<li><a href="Meta/Battery.cfm">Run a battery of tests</a> (not working yet)</li>
	</cfif>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>