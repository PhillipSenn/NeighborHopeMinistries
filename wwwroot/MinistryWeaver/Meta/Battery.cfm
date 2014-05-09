<cfscript>
// This stored procedure works.
// It gets the UserID and UserSessionID
svc = new storedProc();
svc.setProcedure('app.Login');
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='SA'); // UserName
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='MinistryWeaver'); // Password
svc.addParam(cfsqltype="cf_sql_integer",variable='UserID',type="out"); 
svc.addParam(cfsqltype="CF_SQL_VARCHAR",variable='UserSessionID',type="out"); 
svc.addParam(cfsqltype="CF_SQL_BIT",variable='MustChangePassword',type="out"); 
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='MacBookPro'); 
svc.addParam(cfsqltype="CF_SQL_BIT",variable='isAdmin',type="out"); 
obj = svc.execute();
session.User = {};
session.User.Prefix	= obj.getPrefix();
session.User.UserID = obj.getProcOutVariables().UserID;
session.User.UserSessionID = obj.getProcOutVariables().UserSessionID;
session.User.MustChangePassword = obj.getProcOutVariables().MustChangePassword;
session.User.isAdmin = obj.getProcOutVariables().isAdmin;



// This stored procedure works
result = {};
svc = new storedProc();
svc.setReturnCode('yes');
svc.setDebug('yes');
svc.setProcedure('app.BrowseObjects');
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // ClassID
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // RegionID
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=0); // StateID
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // PageNumber
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=50); // RowsPerPage
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // OrderByCol
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // SortAscending
svc.addProcResult(name='qry'); 
obj = svc.execute();
result.Prefix = obj.getPrefix();
if (result.Prefix.StatusCode) {
	WriteOutput('statusCode: ' & result.Prefix.StatusCode);
	abort;
}
qry = obj.getProcResultSets().qry;
writedump(var=qry,top=3);




// This stored procedure doesn't work
result = {};
svc = new storedProc();
svc.setReturnCode('yes');
svc.setDebug('yes');
svc.setProcedure('app.BrowseActivity');
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=session.User.UserID);
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value=session.User.UserSessionID);
svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // ClassID
svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // RegionID
svc.addParam(cfsqltype="CF_SQL_SMALLINT",value=0); // StateID
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // NewObjects
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Workflow
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Associations
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // Forms

svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='01/01/2010'); // FromDate
svc.addParam(cfsqltype="CF_SQL_VARCHAR",value='12/12/2013'); // ToDate

svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); //  Page Number
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1000); // RowsPerPage
svc.addParam(cfsqltype="CF_SQL_INTEGER",value=1); // OrderByCol
svc.addProcResult(name='qry'); 
obj = svc.execute();
result.Prefix = obj.getPrefix();
if (result.Prefix.StatusCode) {
	WriteOutput('statusCode: ' & result.Prefix.StatusCode);
	abort;
}
qry = obj.getProcResultSets().qry;
writedump(var=qry,top=3);


</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>