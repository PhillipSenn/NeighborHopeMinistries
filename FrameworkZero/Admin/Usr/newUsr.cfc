component {
function Insert() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	DECLARE @UsrSort Int = #Val(arguments.UsrSort)#;
	DECLARE @isAdmin Int = #Val(arguments.isAdmin)#;
	INSERT INTO Usr(UsrName,UsrPass,UsrSort,isAdmin) VALUES(?,?,@UsrSort,@isAdmin);
	SELECT *
	FROM UsrView
	WHERE UsrID = Scope_Identity(); -- Get default values
	";
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(arguments.UsrName,8));
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=Left(arguments.UsrPass,4));
	include "/Inc/execute.cfm";
	return local.result;
}
}
