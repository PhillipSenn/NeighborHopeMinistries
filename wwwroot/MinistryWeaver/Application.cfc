component {
this.Name = "MinistryWeaver"
this.Datasource = "PaulNielsen"
this.SessionManagement = true
this.ScriptProtect = "all"
this.baseTemplatePath = GetBaseTemplatePath()

public boolean function onApplicationStart() {
	lock scope="application" type="exclusive" timeout="10" {
		Application.fw = {}
		Application.fw.Name = "Ministry Weaver"
		Application.fw.homeDir = "/"
		local.ErrorCode = new com.MetaData.ErrorCodes().Where()
		for (local.qry in local.ErrorCode.qry) {
			Application.ErrorCodes[local.qry.ErrorCodeID] = local.qry.Message
		}
		Application.ErrorCodes[0] = '' // Success.
	}
	return true
}

public void function onSessionStart() {
	StructDelete(session,"User")
	session.msg = ''
}

public boolean function onRequestStart(String targetPage) {
	request.fw = {}
	request.fw.tickCount = GetTickCount()
	StructAppend(form,url,false)
	if (StructKeyExists(form,"onApplicationStart")) {
		onApplicationStart()
	}
	if (StructKeyExists(form,"onSessionStart")) {
		onSessionStart()
	}
	if (IsDefined('form.Logout')) {
		onSessionStart()
	}
	request.msg = session.msg
	if (IsDefined('form.Email') && IsDefined('form.Password')) {
		local.User = new com.User().Login(form)
		if (IsDefined('local.User.Prefix')) {
			session.User = Duplicate(local.User)
		} else {
			request.msg = form.Email & " not found or password doesn't match."
		}
	}
	if (!CompareNoCase('C:\home\MattSenn.com\ministryweaver\Index.cfm',this.baseTemplatePath)) {
	} else if (FindNoCase('/meta/',this.baseTemplatePath)) {
	} else if (FindNoCase('\meta\',this.baseTemplatePath)) {
	} else if (FindNoCase('/register/',this.baseTemplatePath)) {
	} else if (FindNoCase('\register\',this.baseTemplatePath)) {
	} else if (IsDefined('session.User')) {
		// You're logged in
	} else {
		WriteOutput(this.baseTemplatePath)
		include "/Inc/appLogin.cfm"
		abort
	}
	request.msg = "This is where the msg will go."
	return true
}

}
