<cfcomponent>
<cffunction name="browseActivity">
	<cfstoredproc procedure="app.BrowseActivity" debug="yes" result="local.result" returncode="yes">
	<cfprocparam cfsqltype="cf_sql_integer" value="#session.User.UserID#">
	<cfprocparam cfsqltype="cf_sql_varchar" value="#session.User.UserSessionID#">

	<cfprocparam cfsqltype="cf_sql_smallint" value="0">
	<cfprocparam cfsqltype="cf_sql_smallint" value="0">
	<cfprocparam cfsqltype="cf_sql_smallint" value="0">

	<cfprocparam cfsqltype="cf_sql_integer" value="1">
	<cfprocparam cfsqltype="cf_sql_integer" value="1">
	<cfprocparam cfsqltype="cf_sql_integer" value="1">
	<cfprocparam cfsqltype="cf_sql_integer" value="1">

	<cfprocparam cfsqltype="cf_sql_varchar" value="1/1/2010">
	<cfprocparam cfsqltype="cf_sql_varchar" value="12/12/2013">

	<cfprocparam cfsqltype="cf_sql_integer" value="1">
	<cfprocparam cfsqltype="cf_sql_integer" value="1000">
	<cfprocparam cfsqltype="cf_sql_integer" value="1">
	</cfstoredproc>
	<cfdump var="#local#">
	<cfreturn local.result>
</cffunction>
</cfcomponent>