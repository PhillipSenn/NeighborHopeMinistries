component {
this.Name = 'NeighborHopeMinistries05084'
this.Datasource = 'NeighborHopeMinistries'
this.SessionManagement = true
this.ScriptProtect = 'all'
this.mappings['com'] = 'C:\home\NeighborHopeMinistries.com\com' // Production only - dev points to dev
this.mappings['Passwords'] = 'c:\home\Passwords\NeighborHopeMinistries\Dev' // Production will point to Production
// this.TemplatePath = GetTemplatePath()

public boolean function onApplicationStart() {
	Application.fw = {} // The Application Framework
	Application.fw.Name = 'Neighbor Hope Ministries'
	Application.fw.msg = ''

	Application.fw.log = {}
	Application.fw.log.db = true 		// INSERT INTO LogDB
	Application.fw.log.DBMax = 0		// Every session defaults to logging a maximum of n rows
	Application.fw.log.DBErr = true 	// INSERT INTO LogDBErr
	Application.fw.log.cf  = true
	Application.fw.log.cfErr = true
	Application.fw.log.cfc = true
	Application.fw.log.CFErrCounter = 0
	Application.fw.log.DBErrCounter = 0

	Application.fw.try = {}
	Application.fw.try.catch = true
	Application.fw.try.abort = true
	Application.fw.try.class = 'label-danger'
	Application.fw.try.email = 'PhillipSenn@gmail.com'
	Application.fw.js = true
	Application.fw.css= true
	Application.fw.hidden = false // Hide #main until the page has loaded.
	return true
}

public void function onSessionStart() {
	session.fw = Duplicate(Application.fw)
	session.fw.log.Sort = 0
}

public boolean function onRequestStart(String targetPage) {
	request.fw.tickCount = GetTickCount()
	StructAppend(form,url,false)
	request.fw = Duplicate(session.fw)
	request.fw.msgClass = 'label-danger'
	request.fw.log.Sort=0 // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC
	request.fw.tickCount = GetTickCount()
	setting showDebugOutput=false;
	if (session.fw.log.CFErrCounter > 30) {
		request.fw.msg = "It looks like you've experienced #session.fw.log.CFErrCounter# application errors."
		request.fw.Detail = 'I better shut things down for now.'
		include '/Inc/onError.cfm'
		return false
	}
	if (session.fw.log.DBErrCounter > 30) {
		request.fw.msg = "It looks like you've experienced #session.fw.log.DBErrCounter# database errors."
		request.fw.Detail = 'I better shut things down for now.'
		include '/Inc/onError.cfm'
		return false
	}
	local.LogCFCName = targetPage;
	local.LogCFCDesc = 'onRequestStart()';
	new com.LogCFC().Save(local);

	if (IsDefined('form.onApplicationStart')) {
		onApplicationStart()
		request.fw.msg = 'onApplicationStart'
		request.fw.msgClass = 'label-info'
	}
	if (IsDefined('form.onSessionStart')) {
		onSessionStart()
		request.fw.msg = 'onSessionStart'
		request.fw.msgClass = 'label-info'
	}

	if (IsDefined('form.logout')) {
		StructDelete(session,'Person')
	}
	if (IsDefined('form.UniqueID')) {
		local.Person = new com.Person().WhereUniqueID(form)
		if (IsDefined('local.Person.Prefix') AND local.Person.Prefix.Recordcount) {
			session.Person = Duplicate(local.Person)
		}
	}
	return true
}
/*
public void function onError(Exception,EventName) {
	if (!IsDefined('session.fw.log.CFErr')) return
	if (!session.fw.log.CFErr) return
	session.fw.log.CFErrCounter += 1 // See onRequestStart

	if (IsDefined('arguments.Exception.Message')) {
		request.fw.msg = Exception.Message
		local.LogCFErrMessage = Exception.Message
	} else {
		local.LogCFErrMessage = 'No Exception.Message'
	}

	request.fw.Detail = ''
	if (isDefined('arguments.Exception.Number')) {
		request.fw.Detail &= 'Exception.Number: #arguments.Exception.Number#<br>'
		local.LogCFErrNumber = Exception.Number
	} else {
		local.LogCFErrNumber = 'No Exception.Number'
	}
	if (isDefined('arguments.Exception.TagContext') && IsArray(Exception.TagContext) && ArrayLen(Exception.TagContext)) {
		request.fw.Detail &= 'Exception.TagContext[1].Line: #arguments.Exception.TagContext[1].Line#<br>'
		local.LogCFErrLine = Exception.TagContext[1].Line
	} else {
		local.LogCFErrLine = 0
	}

	if (isDefined('arguments.Exception.Name')) {
		request.fw.Detail &= 'Exception.Name: #arguments.Exception.Name#<br>'
		local.LogCFErrName = Exception.Name
	} else {
		local.LogCFErrName = 'No Exception.Name'
	}
	if (isDefined('arguments.Exception.Detail') AND arguments.Exception.Detail != '') {
		request.fw.Detail &= 'Exception.Detail: #arguments.Exception.Detail#<br>'
		local.LogCFErrDetail = Exception.Detail
	} else {
		local.LogCFErrDetail = 'No Exception.Detail'
	}
	if (isDefined('arguments.Exception.Type')) {
		request.fw.Detail &= 'Exception.Type: #arguments.Exception.Type#<br>'
		local.LogCFErrType = Exception.Type
	} else {
		local.LogCFErrType = 'No Exception.Type'
	}
	if (IsDefined('arguments.EventName') AND arguments.EventName != '') {
		request.fw.Detail &= 'EventName: #arguments.EventName#<br>'
		local.LogCFErrEventName = arguments.EventName
	} else {
		local.LogCFErrEventName = 'No arguments.EventName'
	}
	request.fw.Detail &= '</pre>'

	local.svc = new mail()
	local.svc.setSubject(Application.fw.Name & ': ' & ListLast(GetBaseTemplatePath(),'\'))
	local.svc.setBody('Exception.Message: #request.fw.msg#<p>#request.fw.Detail#</p>')
	
	include '/Passwords/Email.cfm'
	//  local.Password=
	local.port=465
	local.server='smtp.gmail.com'
	local.type='html'
	local.UserName='PhillipSenn@gmail.com'
	local.useSSL=true

	local.svc.setPort(local.Port)
	local.svc.setServer(local.Server)
	local.svc.setType(local.Type)
	local.svc.setUserName(local.UserName)
	local.svc.setUseSSL(local.UseSSL)

	
	
	
//	local.svc.setServer('mail.NeighborHopeMinistries.com') You know what? Since these emails are going to me, I don't care.
	local.UserName = 'admin@NeighborHopeMinistries.com'
//	local.svc.setUseSSL(false)
//	include "/Passwords/Admin.cfm"

	local.svc.setFrom(local.UserName)
	local.svc.setPassword(local.Password)
	local.svc.setTo('Phillip Senn<PhillipSenn@gmail.com>, Paul Nielsen<pauln@ministryweaver.com>')
	local.svc.setReplyTo('noreply@NeighborHopeMinistries.com') // This doesn't seem to work
	local.svc.Send()

	request.fw.log.Sort += 1; // I use the same counter for LogDB, LogDBErr, LogCF, LogCFErr, LogCFC
	local.LogCFID = new com.LogCF().Save()
	local.sql = '
	DECLARE @LogCFErrID Int = NEXT VALUE FOR LogCFErrID;
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

	request.fw.Detail = '<pre>#request.fw.Detail#</pre>'
	request.fw.Detail &= "I've sent an email to the administrator."
	include "/Inc/onError.cfm"
}
*/
public void function onRequestEnd(String targetPage) {
	local.LogCFCName = targetPage;
	local.LogCFCDesc = 'onRequestEnd()';
	new com.LogCFC().Save(local); // hmm. I could save the session.fw.msg here...
	session.fw.msg = ''
}

public void function onSessionEnd(SessionScope,ApplicationScope){
	local.LogCFCName = 'Application.cfc';
	local.LogCFCDesc = 'onSessionEnd()';
	new com.LogCFC().Save(local);
}

public void function onApplicationEnd(ApplicationScope){
	local.LogCFCName = 'Application.cfc';
	local.LogCFCDesc = 'onApplicationEnd()';
	new com.LogCFC().Save(local);
}

public boolean function onMissingTemplate(String targetPage) {
	local.LogCFCName = targetPage;
	local.LogCFCDesc = 'onMissingTemplate()';
	new com.LogCFC().Save(local);
	return true;
}

}
