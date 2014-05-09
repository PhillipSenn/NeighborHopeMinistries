component {
this.Name = "NeighborHopeMinistries"
this.Datasource = "NeighborHopeMinistries"
this.SessionManagement = true
this.ScriptProtect = "all"
// this.mappings["com"] = "C:\home\NeighborHopeMinistries.com\com" Production only - dev points to dev
this.mappings["Passwords"] = "c:\home\Passwords"
// this.TemplatePath = GetTemplatePath()

public boolean function onApplicationStart() {
	Application.fw = {}; // The Application Framework
	Application.fw.Name = "Neighbor Hope Ministries"
	Application.fw.Path = "/"

	Application.Stripe = {};
	Application.Stripe.Live = {};
	Application.Stripe.Test.PublishableKey = 'pk_WMRAFml8LGNp9ryfsctbhECkE84jE';
	Application.Stripe.Live.PublishableKey = 'pk_WznRi8GtzXtfMu9Kv2j23FCrlLTpO';

	Application.Stripe.Test.SecretKey = 'c:\home\Passwords';
	Application.Stripe.Live.SecretKey = 'c:\home\Passwords';
	include "/Passwords/NeighborHopeMinistries.cfm"
	return true
}

public void function onSessionStart() {
	session.fw = {}
	session.fw.msg = ''
}

public boolean function onRequestStart(String targetPage) {
	request.fw.tickCount = GetTickCount()
	StructAppend(form,url,false)
	request.fw = {}
	request.fw.msg = session.fw.msg
	request.fw.msgClass = 'label-danger'
	request.fw.js = true
	request.fw.trackjs = false
	request.fw.css= true
	request.fw.navbar = "navbar-fixed-top"
	request.fw.Container = true
	request.fw.hidden = false
	request.fw.tickCount = GetTickCount()
	if (StructKeyExists(form,"onApplicationStart")) {
		onApplicationStart()
		request.fw.msg = 'onApplicationStart'
		request.fw.msgClass = 'label-info'
	}
	if (StructKeyExists(form,"onSessionStart")) {
		onSessionStart()
		request.fw.msg = 'onSessionStart'
		request.fw.msgClass = 'label-info'
	}

	setting showDebugOutput=false;
	if (IsDefined('form.logout')) {
		StructDelete(session,"Person")
	}
	if (IsDefined('form.UniqueID')) {
		local.Person = new com.Person().WhereUniqueID(form)
		if (IsDefined('local.Person.Prefix') AND local.Person.Prefix.Recordcount) {
			session.Person = Duplicate(local.Person)
		}
	}
	return true
}

public void function onRequestEnd(String targetPage) {
	session.fw.msg = ''
}
}
