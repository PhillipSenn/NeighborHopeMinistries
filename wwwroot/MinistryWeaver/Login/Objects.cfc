component {

function browseObjects(form) {
	include "/Inc/newProc.cfm";
	local.svc.setProcedure('app.BrowseObjects');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // ClassID
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // RegionID
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // StateID
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // PageNumber
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=50); // RowsPerPage
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // OrderByCol
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // SortAscending
	local.svc.addProcResult(name='qry'); 
	include "/Inc/exec.cfm";
	local.result.qry = local.obj.getProcResultSets().qry;
	return local.result;
}

function browseActivity(form) {
	include "/Inc/newProc.cfm";
	local.svc.setProcedure('app.BrowseActivity');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
	local.svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // ClassID
	local.svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // RegionID
	local.svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // StateID
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // NewObjects
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Workflow
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Associations
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Forms

	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='01/01/2010'); // FromDate
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='12/12/2013'); // ToDate

	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); //  Page Number
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1000); // RowsPerPage
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // OrderByCol
	local.svc.addProcResult(name='qry'); 
	include "/Inc/exec.cfm";
	local.result.qry = local.obj.getProcResultSets().qry;
	return local.result;
}
}
