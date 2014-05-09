<cfcomponent>
<cffunction name="Login">
	<cfargument name="arg">
	<cfstoredproc procedure="app.Login" result="local.result" returncode="yes" debug="yes">
		<cfprocparam cfsqltype="cf_sql_varchar" type="in" value="#arg.Email#">
		<cfprocparam cfsqltype="cf_sql_varchar" type="in" value="#arg.Password#">
		<cfprocparam cfsqltype="cf_sql_integer" type="out" variable="local.UserID">
		<cfprocparam cfsqltype="cf_sql_varchar" type="out" variable="local.UserSessionID">
		<cfprocparam cfsqltype="cf_sql_bit"		 type="out" variable="local.MustChangePassword">
		<cfprocparam cfsqltype="cf_sql_varchar" type="in" value="MacBookPro">
		<cfprocparam cfsqltype="cf_sql_bit"		 type="out" variable="local.isAdmin">
	</cfstoredproc>
	<cfreturn local.result>
</cffunction>
</cfcomponent>