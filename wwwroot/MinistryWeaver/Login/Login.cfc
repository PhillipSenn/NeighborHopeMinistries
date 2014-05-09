component {

function Favorites() {
	include "/Inc/newProc.cfm";
	local.svc.setProcedure('app.getFavorites');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
	include "/Inc/exec.cfm";
	return local.result;
}

function CheckLogin(form) {
	local.result = {};
	local.svc = new storedProc();
	local.svc.setProcedure('app.CheckLogin');
	local.svc.setReturnCode('yes');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=form.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.UserSessionID);
	try {
		local.obj = local.svc.execute();
		local.result.Prefix	= local.obj.getPrefix();
	} catch(any Exception) {
		request.fw.msg = Exception.Detail;
	}
	return local.result;
}


function CheckLoginX(form) {
	local.result = {};
	local.svc = new storedProc();
	local.svc.setProcedure('app.CheckLoginX');
	local.svc.setReturnCode('yes');
	local.svc.addParam(cfsqltype="CF_SQL_INTEGER",value=form.UserID);
	local.svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=form.UserSessionID);
	try {
		local.obj = local.svc.execute();
		local.result.Prefix	= local.obj.getPrefix();
	} catch(any Exception) {
		request.fw.msg = Exception.Detail;
	}
	return local.result;
}
}