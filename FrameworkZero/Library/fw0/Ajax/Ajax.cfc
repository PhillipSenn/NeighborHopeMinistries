component {

remote function Save() returnformat="json" { // plain
	include "/Inc/newQuery.cfm";
	local.sql = "
	";
	include "/Inc/execute.cfm";
	url.queryFormat = "column";
	return local.result;
}
}
