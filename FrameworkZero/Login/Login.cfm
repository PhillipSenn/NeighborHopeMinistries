<!---
<cfscript>
Usr = new FrameworkZero.Login.Login().ValidUsers();
</cfscript>
--->

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>This would normally be a login screen:</h1>
<div class="col-md-4">
	<form method="post" action="#Application.fw0.homeDir#">
		<label for="FrameworkZeroID">Which User do you want to be?</label>
		<select id="FrameworkZeroID" name="FrameworkZeroID">
			<option value="0">Please Select</option>
			<option value="399EF2B2-3A47-4AA8-B138-B96FCDFEBB00">John Doe</option>
			<!---
			<cfloop query="Usr.qry">
				<option value="#UsrID#">#UsrName#</option>
			</cfloop>
			--->
		</select>
		<p>
			<button type="submit" name="Save">Login</button>
		</p>
	</form>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>