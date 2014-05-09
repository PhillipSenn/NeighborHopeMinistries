component extends="Library.fw0.ReadWhereDelete" {
Variables.TableName = "LogDBErr";
Variables.TableSort = "LogDBErrID DESC";
Variables.MetaData = GetMetaData();

function Save(form) { // form was the local scope when passed.  So form.result was local.result.
	param request.fw0.TickCount = GetTickCount();
	param request.fw0.LogDBSort = 0; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr
	request.fw0.LogDBSort += 1;

	if (IsDefined("form.MetaData.FullName")) {
		local.MetaData = form.MetaData;
	}
	local.result.Prefix = {};
	if (StructKeyExists(form.result.Exception,"sql")) {
		local.result.Prefix.sql = form.result.Exception.sql;
	}
	local.result.Prefix.RecordCount = 0;
	local.result.Prefix.ExecutionTime = 0;
	local.LogDBFunctionName	= form.LogDBErrFunctionName;
	local.LogDB = new com.LogDB().Save(local);

	// ErrorCode and SQLState are Integers
	if (StructKeyExists(form.result.Exception,"NativeErrorCode")) {
		local.LogDBErrCode = form.result.Exception.NativeErrorCode;
	} else {
		local.LogDBErrCode = 0;
	}
	if (StructKeyExists(form.result.Exception,"SQLState")) {
		local.LogDBErrSQLState = form.result.Exception.SQLState;
	} else {
		local.LogDBErrSQLState = 0;
	}

	// Type, Name, Desc are varchar
	if (StructKeyExists(form.result.Exception,"Type")) {
		local.LogDBErrType = form.result.Exception.Type;
	} else {
		local.LogDBErrType = "form.result.Exception.Type";
	}
	if (StructKeyExists(form.result.Exception,"Message")) {
		local.LogDBErrName = form.result.Exception.Message;
	} else {
		local.LogDBErrName = "form.result.Exception.Message";
	}
	if (StructKeyExists(form.result.Exception,"Detail")) {
		local.LogDBErrDesc = form.result.Exception.Detail;
	} else {
		local.LogDBErrDesc = "form.result.Exception.Detail";
	}

	if (StructKeyExists(form.result.Exception,"queryError")) {
		local.LogDBErrQuery = form.result.Exception.QueryError;
		if (local.LogDBErrQuery != local.LogDBErrDesc) {
			local.LogDBErrDesc &= '<br>' & local.LogDBErrQuery;
		}
	}
//	if (StructKeyExists(form.result.Exception,"where")) {
//		local.LogDBErrWhere = form.result.Exception.where;
//	} else {
//		local.LogDBErrWhere = "form.result.Exception.where";
//	}
	lock scope="application" type="exlusive" timeout="10" {
		Application.fw0.LogDBErrID += 1;
		if (Application.fw0.LogDBErrID > 9999) {
			Application.fw0.LogDBErrID -= 9999;
		}
		local.LogDBErrID = Application.fw0.LogDBErrID;
	}
	local.sql = "
	DECLARE @LogDBErrID Int = #Val(local.LogDBErrID)#;
	DECLARE @LogDBID Int = #Val(local.LogDB.qry.LogDBID)#;
	DECLARE @LogDBErrSort Int = #Val(request.fw0.LogDBSort)#;
	DECLARE @LogDBErrElapsed Int = #GetTickCount() - request.fw0.TickCount#;
	DECLARE @LogDBErrCode Int = #Val(local.LogDBErrCode)#;
	DECLARE @LogDBErrSQLState Int = #Val(local.LogDBErrSQLState)#;
	UPDATE LogDBErr SET
	 LogDBErr_LogDBID=@LogDBID
	,LogDBErrSort=@LogDBErrSort
	,LogDBErrElapsed=@LogDBErrElapsed
	,LogDBErrCode=@LogDBErrCode
	,LogDBErrSQLState=@LogDBErrSQLState
	,LogDBErrDateTime = getdate()
	,LogDBErrType=?
	,LogDBErrName=?
	,LogDBErrDesc=?
	WHERE LogDBErrID=@LogDBErrID
	";
	local.svc = new query();
	local.svc.setSQL(local.sql);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrType);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrName);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=local.LogDBErrDesc);
	local.svc.execute();

	WriteOutput('<html>' & Chr(10));
	WriteOutput('<body>' & Chr(10));
	WriteOutput('It looks like you got the following error:<pre>' & form.result.Exception.Detail & '</pre>' & Chr(10));
	if (IsDefined('request.fw0.mail') && request.fw0.mail) {
		local.svc = new mail();
		local.svc.setSubject(Application.fw0.Name & ': ' & ListLast(GetBaseTemplatePath(),'\'));
		local.msg  = '';
		if (StructKeyExists(form.result.Exception,"Datasource")) {
			local.msg &= 'Datasource: ' & form.result.Exception.datasource & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"Detail")) {
			local.msg &= 'Detail: ' & form.result.Exception.Detail & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"Detail")) {
			local.msg &= 'ErrorCode: ' & form.result.Exception.ErrorCode & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"Message")) {
			local.msg &= 'Message: ' & form.result.Exception.message & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"NativeErrorCode")) {
			local.msg &= 'NativeErrorCode: ' & form.result.Exception.NativeErrorCode & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"SQLState")) {
			local.msg &= 'SQLState: ' & form.result.Exception.SQLState & '<br>';
		}
		// local.msg &= 'StackTrace: ' & form.result.Exception.StackTrace & '<br>';
		if (StructKeyExists(form.result.Exception,"Type")) {
			local.msg &= 'Type: ' & form.result.Exception.Type & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"QueryError")) {
			local.msg &= 'QueryError: ' & form.result.Exception.QueryError & '<br>';
		}
		if (StructKeyExists(form.result.Exception,"Where") && form.result.Exception != '') {
			local.msg &= 'Where: ' & form.result.Exception.Where & '<br>';
		}
		local.msg &= '<p>';
		local.msg &= 'Application: ' & Application.fw0.Name & '<br>';
		local.msg &= 'SCRIPT_NAME: ' & cgi.SCRIPT_NAME & '<br>';
		local.msg &= 'CurrentTmpl: ' & GetCurrentTemplatePath() & '<br>';
		local.msg &= '</p>';
		if (StructKeyExists(form.result.Exception,"sql")) {
			local.msg &= '<pre>' & form.result.Exception.sql & '</pre>';
		} else {
			local.msg &= '<pre>form.result.Exception.sql is empty.</pre>';
		}
		local.svc.setBody(local.msg);
		include "/Passwords/FrameworkZero.cfm";
		local.svc.setServer(local.Server);
		local.svc.setType(local.Type);
		local.svc.setUseSSL(local.UseSSL);
		local.svc.setPort(local.Port);
		local.svc.setFrom(local.UserName);
		local.svc.setUserName(local.UserName);
		local.svc.setPassword(local.Password);
	
	
		local.svc.setTo('Administrator<#local.UserName#>');
		local.svc.Send();
		WriteOutput("<p>I've sent an email to the administrator to let them know.</p>" & Chr(10));
	}
	WriteOutput('</body>' & Chr(10));
	WriteOutput('</html>');
	abort;
}
}