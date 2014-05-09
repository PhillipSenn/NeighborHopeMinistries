<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Register.css">
<cfinclude template="/Inc/body.cfm">
Create Web Account:<br>
Help us location you in the database.
<form method="post">
	<div class="row">
		<div class="col-md-2 col-md-offset-6">
			Name:
		</div>
		<div class="col-md-4">
			<input name="Name">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-6">
			Phone Number:
		</div>
		<div class="col-md-4">
			<input name="Phone">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-6">
			email:
		</div>
		<div class="col-md-4">
			<input name="Email" type="email">
		</div>
	</div>
	<fieldset class="well">
		<legend>Already have an account?</legend>
		If you've been involved with the ministry before, you're probably already in our database.
		To help us keep our data correct, please enter your personal code from a receipt or letter.
		<div class="row">
			<div class="col-md-2 col-md-offset-6">
				Code:
			</div>
			<div class="col-md-4">
				<input name="Code" autofocus>
			</div>
		</div>
	</fieldset>
	<p>We will send a verification email.</p>
	<div class="row">
		<div class="col-md-6 col-md-offset-6">
			<a class="btn" href="/">Cancel</a>
			<button type="submit" name="Save">Done</button>
		</div>
	</div>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>