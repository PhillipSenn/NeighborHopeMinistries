<cfscript>
local.arr = local.svc.getParams()
for (i=1; i<=ArrayLen(local.arr); i++) {
	local.myObj = local.arr[i]
	local.myValue = local.myObj.value
	if (Find('--',local.myValue)) {
		request.fw.msg = 'Comments are not allowed.'
		return
	}
	if (Find(';',local.myValue)) {
		request.fw.msg = 'Semicolons are not allowed.'
		return
	}
}

if (StructKeyExists(Variables,"Metadata")) {
	local.Metadata = Variables.Metadata;
}
local.svc.setSQL(local.sql);
if (local.fw.LogDBErr) { // If we are catching errors
	try {
		local.obj = local.svc.execute();
		local.result.qry = local.obj.getResult();
		local.result.Prefix = local.obj.getPrefix();
	} catch(any Exception) {
		session.fw.LogDBErrCounter += 1; // See onRequestStart
		local.result.Exception = Exception;
		if (IsDefined("request.fw.LogCFID")) {
			local.LogCFID = request.fw.LogCFID;
		} else {
			local.LogCFID = new com.LogCF().Save();
		}
		new com.LogDBErr().Save(local);
	}
} else {
	local.obj = local.svc.execute();
	local.result.qry = local.obj.getResult();
	local.result.Prefix = local.obj.getPrefix();
}
if (local.fw.LogDB) { // If we are logging this database call
	if (IsDefined("local.result.Prefix")) {
		Application.LogDB.Save(local);
	}
}
</cfscript>
