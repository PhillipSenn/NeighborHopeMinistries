component {

function QuickSearch(form) {
	include "/Inc/newProc.cfm";
	local.svc.setProcedure('app.QuickSearch');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.quickSearch);
	include "/Inc/exec.cfm";

	local.svc.addProcResult(name='qry'); 
	local.obj = local.svc.execute();
	local.result.qry = local.obj.getProcResultSets().qry;
	return local.result;
}
}
