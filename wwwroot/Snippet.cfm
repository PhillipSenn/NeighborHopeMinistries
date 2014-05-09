	param request.fw.log.Sort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC
	request.fw.log.Sort += 1;

	local.LogCFID = new com.LogCF().Save();
	param request.fw.TickCount = GetTickCount();

	lock scope='application' type='exlusive' timeout='10' {
		Application.fw.LogCFErrID += 1;
		if (Application.fw.LogCFErrID > 9999) {
			Application.fw.LogCFErrID -= 9999;
		}
		local.LogCFErrID = Application.fw.LogCFErrID;
	}

	local.sql = '
	DECLARE @LogCFErrID Int = #Val(local.LogCFErrID)#;
	DECLARE @LogCFID Int = #Val(local.LogCFID)#;
	DECLARE @LogCFErrSort Int = #Val(request.fw.log.Sort)#;
	DECLARE @LogCFErrElapsed Int = #GetTickCount() - request.fw.TickCount#;
	DECLARE @LogCFErrNumber Int = #Val(local.LogCFErrNumber)#;
	DECLARE @LogCFErrLine Int = #Val(local.LogCFErrLine)#;
	
	UPDATE LogCFErr SET
	 LogCFErr_LogCFID		= @LogCFID
	,LogCFErrSort			= @LogCFErrSort
	,LogCFErrNumber		= @LogCFErrNumber
	,LogCFErrElapsed		= @LogCFErrElapsed
	,LogCFErrLine			= @LogCFErrLine
	,LogCFErrDatetime		= getdate()
	,LogCFErrName			= ?
	,LogCFErrDetail		= ?
	,LogCFErrMessage		= ?
	,LogCFErrType			= ?
	,LogCFErrEventName	= ?
	WHERE LogCFErrID = @LogCFErrID
	';
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype='CF_SQL_VARCHAR',value=Left(local.LogCFErrName,512));
	local.svc.addParam(cfsqltype='CF_SQL_VARCHAR',value=Left(local.LogCFErrDetail,512));
	local.svc.addParam(cfsqltype='CF_SQL_VARCHAR',value=Left(local.LogCFErrMessage,512));
	local.svc.addParam(cfsqltype='CF_SQL_VARCHAR',value=Left(local.LogCFErrType,512));
	local.svc.addParam(cfsqltype='CF_SQL_VARCHAR',value=Left(local.LogCFErrEventName,512));
	local.svc.execute();

	include '/Passwords/FrameworkZero.cfm';
	local.svc = new mail();
	local.svc.setSubject(Application.fw.Name & ': ' & ListLast(GetBaseTemplatePath(),'\'));
	local.msg = LogCFErrMessage;
	local.svc.setBody(local.msg);
	
	local.svc.setServer(local.Server);
	local.svc.setType(local.Type);
	local.svc.setUseSSL(local.UseSSL);
	local.svc.setPort(local.Port);
	local.svc.setFrom(local.UserName);
	local.svc.setUserName(local.UserName);
	local.svc.setPassword(local.Password);
	local.svc.setTo(local.UserName);
	local.svc.Send();
