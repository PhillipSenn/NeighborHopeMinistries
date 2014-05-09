component {

function Top1(arg) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 *
	FROM LogDB
	";
	include "/Inc/execute.cfm";
	return local.result;
}
}
