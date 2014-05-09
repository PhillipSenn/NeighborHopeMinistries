component {

function Top10() {
	local.result = {};
	local.svc = new query();
	local.svc.setDataSource("FirstLastName");
	local.sql = "SELECT TOP 10 LastName FROM LastName ORDER BY LastNameID";
	local.svc.setSQL(local.sql);
	local.obj = local.svc.execute();
	return local.obj.getResult();
}

remote function Top5000() returnformat='json' {
	local.result = {};
	local.svc = new query();
	local.svc.setDataSource("FirstLastName");
	local.sql = "SELECT TOP 5000 LastName FROM LastName ORDER BY LastNameID";
	local.svc.setSQL(local.sql);
	local.obj = local.svc.execute();
	url.queryFormat = "column";
	return local.obj.getResult();
}

remote function Top5000A() returnformat='plain' {
	local.svc = new query();
	local.svc.setDataSource("FirstLastName");
	local.sql = "SELECT TOP 5000 LastName FROM LastName ORDER BY LastNameID";
	local.svc.setSQL(local.sql);
	local.obj = local.svc.execute();
	local.result = '{ "aaData": [';
	var CurrentRow = 0;
	for (local.qry in local.obj.getResult()) {
		CurrentRow += 1;
		if (CurrentRow > 1) {
			local.result &= ',';
		}
		local.result &= '[' & local.qry.LastName & ']';
	}
	local.result &= '] }';
	return local.result;
}
}
