component {

// required: form.Email, form.Password
// returns 1 return code
// returns 1 qry
// returns 4 output variables
function Login(form) {
	local.result = {}
	if (false) {
		local.svc = new storedProc()
		local.svc.setProcedure('app.Login')
		local.svc.setReturnCode('yes')
		local.svc.setDebug('yes')
		local.svc.addParam(cfsqltype='cf_sql_VARCHAR',value=form.Email)
		local.svc.addParam(cfsqltype='cf_sql_VARCHAR',value=form.Password)
		local.svc.addParam(cfsqltype='cf_sql_INTEGER',type='out',variable='UserID') 
		local.svc.addParam(cfsqltype='cf_sql_VARCHAR',type='out',variable='UserSessionID') 
		local.svc.addParam(cfsqltype='cf_sql_BIT',type='out',variable='MustChangePassword') 
		local.svc.addParam(cfsqltype='cf_sql_VARCHAR',value='MacBookPro') 
		local.svc.addParam(cfsqltype='cf_sql_BIT',type='out',variable='isAdmin') 
		local.obj = local.svc.execute()
		local.result.Prefix	= local.obj.getPrefix()
		local.result.ProcResultSets = local.obj.getProcResultSets()
		local.result.MustChangePassword = local.obj.getProcOutVariables().MustChangePassword
		local.result.UserID = local.obj.getProcOutVariables().UserID
		local.result.UserSessionID = local.obj.getProcOutVariables().UserSessionID
		local.result.isAdmin = local.obj.getProcOutVariables().isAdmin
	} else {
		storedproc procedure='app.Login' result='local.result.Prefix' returncode='yes' {
         procparam cfsqltype='cf_sql_VARCHAR'	type='in'	value=form.Email
         procparam cfsqltype='cf_sql_VARCHAR'	type='in'	value=form.Password
         procparam cfsqltype='cf_sql_INTEGER' 	type='out' 	variable='UserID'
         procparam cfsqltype='cf_sql_VARCHAR' 	type='out' 	variable='UserSessionID'
         procparam cfsqltype='cf_sql_BIT'			type='out' 	variable='MustChangePassword'
         procparam cfsqltype='cf_sql_VARCHAR'	type='in'	value='MacBookPro'
         procparam cfsqltype='cf_sql_BIT'			type='out' 	variable='isAdmin'
			procresult name='local.result.qry'
		}
	}
	return local
}

}