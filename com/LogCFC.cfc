component extends="ReadWhereDelete" {
Variables.TableName = "LogCFC";
Variables.TableSort = "LogCFCID DESC";
Variables.MetaData = GetMetaData();

function Save(arg) {
	request.fw.log.Sort += 1; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC
	// local.LogCFCName = ReplaceNoCase(arg.LogCFCName,Application.fw.Path,'');
	if (IsDefined("request.fw.LogCFID")) {
		local.LogCFID = request.fw.LogCFID;
	} else {
		local.LogCFID = 0;
	}

	local.svc = new query()
	local.svc.setSQL('SELECT LogCFCID = NEXT VALUE FOR LogCFCID') // I'm having a hard time executing an update followed by a select in Railo.
	local.obj = local.svc.execute()
	local.LogCFCID = local.obj.getResult().LogCFCID

	local.sql = "
	DECLARE @LogCFCID Int = #Val(local.LogCFCID)#;
	DECLARE @LogDBSort Int = #Val(request.fw.log.Sort)#;
	DECLARE @LogCFCElapsed Int = #GetTickCount() - request.fw.TickCount#;
	DECLARE @LogCFID Int = #Val(local.LogCFID)#;
	
	UPDATE LogCFC SET
	 LogCFC_LogCFID	= @LogCFID
	,LogCFCSort			= @LogDBSort
	,LogCFCElapsed		= @LogCFCElapsed
	,LogCFCDateTime	= getdate()
	,LogCFCName 		= ?
	,LogCFCDesc 		= ?
	WHERE LogCFCID 	= @LogCFCID;
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arg.LogCFCName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arg.LogCFCDesc);
	local.svc.execute();
	// local.result.qry = local.obj.getResult();
	// local.result.Prefix = local.obj.getPrefix();
}
}
