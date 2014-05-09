component {
Variables.Datasource = "FirstLastName";

function Top1000() {
	include "/Inc/newQuery.cfm";
	local.sql = "SELECT TOP 100 LastName FROM LastName ORDER BY LastNameID";
	include "/Inc/execute.cfm";
	return local.result;
}
}
