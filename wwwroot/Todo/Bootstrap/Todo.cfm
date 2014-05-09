<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Todo.css">
<cfinclude template="/Inc/body.cfm">
<fieldset>
	<legend>Task 214 - Review meta-data</legend>
	<div class="row">
		<div class="col-md-2">
			Assigned to:
		</div>
		<div class="col-md-4">
			<select name="AssignedTo">
				<option value="1">Paul Nielsen</option>
			</select>
		</div>
		<div class="col-md-2 col-md-offset-1">
			Task Type: 
		</div>
		<div class="col-md-3">
			<select name="TaskType">
				<option value="1">Reminder</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			Created by:
		</div>
		<div class="col-md-4">
			Paul Nielsen
		</div>
		<div class="col-md-2 col-md-offset-1">
			Priority:
		</div>
		<div class="col-md-3">
			<select name="Priority">
				<option value="1">First-Class</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			Regarding: 
		</div>
		<div class="col-md-4">
			John Doe (p-123) Volunteer (Experienced)
		</div>
		<div class="col-md-2 col-md-offset-1">
			Status:
		</div>
		<div class="col-md-3">
			<select name="Status">
				<option value="1">Open</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			Subject:
		</div>
		<div class="col-md-10">
			<input name="Subject" value="Review meta-data">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			Detail:
		</div>
		<div class="col-md-10">
			<textarea name="Detail"></textarea>
		</div>
	</div>
	<div class="p row textAlign-center">
		<div class="col-md-4">
			<hr>
		</div>
		<div class="col-md-4 textAlign-center">
			<a href="Notes.cfm" class="btn no-lg">Notes</a>
			<a href="History.cfm" class="btn no-lg">History</a>
		</div>
		<div class="col-md-4">
			<hr>
		</div>
	</div>
</fieldset>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>