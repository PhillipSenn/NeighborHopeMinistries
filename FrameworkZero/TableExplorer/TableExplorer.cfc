component {

function WhereTableName(form) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 100 *
	FROM #form.tableName#
	";
	include "/Inc/execute.cfm";
	return local.result;
}
}
