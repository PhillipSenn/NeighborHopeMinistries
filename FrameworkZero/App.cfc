component {
function HighestCFID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogCFID 
	FROM LogCF 
	ORDER BY LogCFDateTime DESC,LogCFID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogCFID;
}

function HighestCFCID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogCFCID 
	FROM LogCFC
	ORDER BY LogCFCDateTime DESC,LogCFCID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogCFCID;
}

function HighestCFErrID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogCFErrID 
	FROM LogCFErr
	ORDER BY LogCFErrDateTime DESC,LogCFErrID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogCFErrID;
}

function HighestDBID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogDBID 
	FROM LogDB
	ORDER BY LogDBDateTime DESC,LogDBID DESC
	";
	local.fw0.LogDB = false; // We can't log getting the top 1 LogDBID because we don't know what LogDBID to use yet.
	include "/Inc/execute.cfm";
	return local.result.qry.LogDBID;
}

function HighestDBErrID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogDBErrID 
	FROM LogDBErr
	ORDER BY LogDBErrDateTime DESC,LogDBErrID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogDBErrID;
}

function HighestJSID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogJSID 
	FROM LogJS
	ORDER BY LogJSDateTime DESC,LogJSID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogJSID;
}

function HighestUIID() {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT TOP 1 LogUIID 
	FROM LogUI
	ORDER BY LogUIDateTime DESC,LogUIID DESC
	";
	include "/Inc/execute.cfm";
	return local.result.qry.LogUIID;
}
}