<cfscript>
/*
try {
	local.obj = local.svc.execute()
} catch(any Exception) {
	request.fw.msg = Exception.Detail
	request.fw.msg = Replace(request.fw.msg,'[Macromedia]','')
	request.fw.msg = Replace(request.fw.msg,'[SQLServer JDBC Driver]','')
	request.fw.msg = replace(request.fw.msg,'[SQLServer]','')
	include "/Inc/html.cfm"
	include "/Inc/body.cfm"
	WriteOutput("Paul: I'm going to dump the exception log here. Normally I wouldn't just do a dump.")
	writedump(Exception)
	include "/Inc/foot.cfm"
	include "/Inc/End.cfm"
	abort
}
*/
local.obj = local.svc.execute()
local.result.Prefix = local.obj.getPrefix()
if (local.result.Prefix.StatusCode) {
	request.fw.msg = Application.ErrorCodes[local.result.Prefix.StatusCode]
	include "/Inc/html.cfm"
	include "/Inc/body.cfm"
	include "/Inc/foot.cfm"
	include "/Inc/End.cfm"
	abort
}
</cfscript>
