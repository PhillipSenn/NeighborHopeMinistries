<cfscript>
local.result = {}
local.svc = new storedProc()
local.svc.setReturnCode('yes')
local.svc.setDebug('yes')
if (StructKeyExists(Variables,"DataSource")) {
	local.svc.setDataSource(Variables.DataSource)
}
</cfscript>