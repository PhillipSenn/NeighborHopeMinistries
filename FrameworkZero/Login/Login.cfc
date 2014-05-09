component {
/*
function ValidUsers() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT *
	FROM UsrView
	WHERE UsrID = 2
	ORDER BY UsrID
	";
	include "/Inc/execute.cfm";
	return local.result;
}
*/
remote function Save(UsrID) { // Why is this called Save? Because you are saving it to the session scope I suppose.  Probably needs to be changed.
	session.Usr = new com.Usr().Read(arguments.UsrID);
}

function WhereFrameworkZeroID(form) {
	if (Len(form.FrameworkZeroID) != 36) return;
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT *
	FROM UsrView
	WHERE FrameworkZeroID = ?
	";
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.FrameworkZeroID);
	include "/Inc/execute.cfm";
	return local.result;
}

}