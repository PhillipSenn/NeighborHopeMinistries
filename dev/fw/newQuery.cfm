<cfscript>
local.result = {};
local.result.msg = "";
local.svc = new query();
if (StructKeyExists(Variables,"DataSource")) {
	local.svc.setDataSource(Variables.DataSource);
}
if (IsDefined("session.fw.LogDB") && session.fw.LogDB) { // Do we log this database call?
	local.fw.LogDB = session.fw.LogDB;
	local.LogDBFunctionName = GetFunctionCalledName() & '()';
} else {
	local.fw.LogDB = false;
}
if (IsDefined("request.fw.LogDBErr")) { // Do we catch errors with this database call?
	local.fw.LogDBErr = request.fw.LogDBErr;
	local.LogDBErrFunctionName = GetFunctionCalledName() & '()';
} else {
	local.fw.LogDBErr = false;
}
</cfscript>