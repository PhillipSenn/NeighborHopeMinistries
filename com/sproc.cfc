component {

// No UserID, UserSessionID
// returns 0 return codes
// returns 1 qry
// returns 0 output variables
function execQ(procedure) {
	local.result = {}
	if (server.ColdFusion.productname == 'Railo') {
		return new Railo().exec(arguments.procedure)
	}
	local.svc = new storedProc()
//	local.svc.setReturnCode('yes')
//	local.svc.setDebug('yes')
	local.svc.setProcedure(arguments.procedure)
	local.svc.addProcResult(name='qry') 
	try {
		local.obj = local.svc.execute()
		local.result.Prefix = local.obj.getPrefix()
		local.result.qry = local.obj.getProcResultSets().qry
//		local.result.ProcOutVariables = local.obj.getProcOutVariables()
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}

// Must be logged in
// returns 1 return code
// returns 0 queries
// returns 0 output variables
function exec(procName) { // required: procName, UserID, UserSessionID.  0 qry result.
	include "/Inc/newProc.cfm"
	local.svc.setProcedure(arguments.procName)
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID)
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID)
	include "/Inc/exec.cfm"
// local.result.qry
// local.result.ProcOutVariables = local.obj.getProcOutVariables()
	return local.result
}

// Must be logged in
// returns 1 return code
// returns 1 qry
// returns 0 output variables
function execQry(procName) {// required: procName, UserID, UserSessionID, 1 qry result.
	include "/Inc/newProc.cfm"
	local.svc.setProcedure(arguments.procName)
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID)
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID)
	local.svc.addProcResult(name='qry') 
	include "/Inc/exec.cfm"
	local.result.qry = local.obj.getProcResultSets().qry
// local.result.ProcOutVariables = local.obj.getProcOutVariables()
	return local.result
}
}
