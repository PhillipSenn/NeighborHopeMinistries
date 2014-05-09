<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<fieldset>
	<legend>New User</legend>
	<label for="UsrName">User Name:</label>
	<input id="UsrName" autofocus>
	<label for="FrameworkZeroID">FrameworkZeroID:</label>
	<input id="FrameworkZeroID">
	<label for="UsrSort">Sort:</label>
	<input type="number" id="UsrSort">
	<div class="checkbox">
	<label>
	<input type="checkbox" id="isAdmin">isAdmin
	</label>
	</div>
	<p>
		<button type="button" id="Save">Save</button>
	</p>
</fieldset>
<cfinclude template="/Inc/foot.cfm">
<script src="NewUsr.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>