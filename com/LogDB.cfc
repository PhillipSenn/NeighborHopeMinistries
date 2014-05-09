component extends="ReadWhereDelete" {
Variables.TableName = "LogDB"
Variables.TableSort = "LogDBID DESC"
Variables.MetaData = GetMetaData()

function Save(arg) {
	request.fw.log.Sort += 1 // This would show how many times this request has made a database call.
	session.fw.log.Sort += 1 // This would show how many times this session has made a database call.
	if (session.fw.log.DBMax AND session.fw.log.Sort > session.fw.log.DBMax) return;
	
	if (IsDefined('arg.Metadata.FullName')) {
		local.LogDBComponentName = arg.MetaData.FullName
	} else {
		local.LogDBComponentName = ''
	}

	local.LogDBName = Trim(arg.result.Prefix.sql) // The sql string that was executed
	local.LogDBName = Replace(local.LogDBName,Chr(9),'','all')
	if (StructKeyExists(arg.result.Prefix,"sqlparameters")) {
		// Replace ? with the corresponding parameters
		for (local.LogIndex=1; local.LogIndex <= ArrayLen(arg.result.Prefix.sqlparameters); local.LogIndex++) {
			if (Find('?',local.LogDBName)) {
				local.LogDBName = Replace(local.LogDBName,'?',"'" & arg.result.Prefix.sqlparameters[local.LogIndex] & "'")
			} else {
				local.LogDBName &= '<span rep="label-danger">' & local.LogIndex & arg.result.Prefix.sqlparameters[local.LogIndex] & '</span>'
			}
		}
		local.LogDBName = Replace(local.LogDBName,'?','<span rep="label-danger">?</span>','all')
	}

	local.svc = new query()
	local.svc.setSQL('SELECT LogDBID = NEXT VALUE FOR LogDBID') // I'm having a hard time executing an update followed by a select in Railo.
	local.obj = local.svc.execute()
	local.LogDBID = local.obj.getResult().LogDBID

	if (IsDefined("request.fw.LogCFID")) {
		local.LogCFID = request.fw.LogCFID
	} else {
		local.LogCFID = 0
	}
	local.sql = "
	DECLARE @LogDBID Int = #Val(local.LogDBID)#
	DECLARE @LogDBSort Int = #Val(request.fw.log.Sort)#
	DECLARE @LogDBElapsed Int = #GetTickCount() - request.fw.TickCount#
	DECLARE @LogDBRecordCount Int = #Val(arg.result.Prefix.RecordCount)#
	DECLARE @LogDBExecutionTime Int = #Val(arg.result.Prefix.ExecutionTime)#
	DECLARE @LogCFID Int = #Val(local.LogCFID)#
	
	UPDATE LogDB SET
	 LogDB_LogCFID			= @LogCFID
	,LogDBSort				= @LogDBSort
	,LogDBElapsed			= @LogDBElapsed
	,LogDBRecordcount		= @LogDBRecordcount
	,LogDBExecutionTime	= @LogDBExecutionTime
	,LogDBDateTime			= getdate()
	,LogDBComponentName	= ?
	,LogDBFunctionName	= ?
	,LogDBName				= ?
	WHERE LogDBID 			= @LogDBID
	"
	local.svc = new query()
	local.svc.setSQL(local.sql)
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBComponentName)
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=arg.LogDBFunctionName)
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBName)
	local.obj = local.svc.execute() // Notice that there's no error trapping on the log here.  hmmm... probably need to fix.

	local.sql = "
	DECLARE @LogDBID Int = #Val(local.LogDBID)#
	SELECT *
	FROM LogDB
	WHERE LogDBID = @LogDBID
	"
	local.svc = new query()
	local.svc.setSQL(local.sql)
	local.obj = local.svc.execute()
	local.result.qry = local.obj.getResult()
	local.result.Prefix = local.obj.getPrefix()
	return local.result // LogDBErr uses this.

}
}