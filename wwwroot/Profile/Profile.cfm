<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="Profile.css">
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<div class="col-md-11 col-md-offset-1">
		John Smith
	</div>
</div>
<div class="row">
	<div class="col-md-1">
		Spouse:
	</div>
	<div class="col-md-11">
		Suzy Smith
	</div>
</div>
<div class="row">
	<div class="col-md-1">
		Church:
	</div>
	<div class="col-md-11">
		<select name="ChurchID">
			<option value="1">Raspberry Mountain Chapel, Centerville, Il</option>
		</select>
	</div>
</div>
<div class="row">
	<div class="col-md-8 col-md-offset-4">
		<a href="addChurch.cfm">Don't see your church? Add it here</a>
	</div>
</div>
<p class="textAlign-center">
	<a href="CallMe.cfm">I have a question, prayer need, or concern, please call me</a>
</p>
<hr>
<p>Contact Info</p>
<div class="row">
	<div class="col-md-5 col-md-offset-1">
		123 Maple Ave
	</div>
	<div class="col-md-6">
		<a href="editContactInfo.cfm">edit contact info</a>
	</div>
</div>
<div class="row">
	<div class="col-md-11 col-md-offset-1">
		Centerville, Il 56812
	</div>
</div>
<div class="row">
	<div class="col-md-11 col-md-offset-1">801 532-5603
	</div>
</div>
<div class="row">
	<div class="col-md-11 col-md-offset-1">John316@gmail.com (1 bounce)
	</div>
</div>
<hr>
<p>Subscriptions</p>
<div class="row">
	<div class="col-md-6">
		<div class="checkbox">
			<label>
				<input type="checkbox" name="Sub1">
				Annual Report
			</label>
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox" name="Sub2" checked>
				Billions &amp; Billions served
			</label>
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox" name="Sub3">
				Mobilize Stories
			</label>
		</div>
		<div class="checkbox">
			<label>
				<input type="checkbox" name="Sub4" checked>
				Heart for Asia
			</label>
		</div>
	</div>
	<div class="col-md-6">
		<a href="editSubscriptions.cfm">Edit Subscriptions</a>
	</div>
</div>
<hr>
<p>Commitments</p>
<div class="row">
	<div class="col-md-6">
		<ul>
			<li>Pray for Wei Pei</li>
			<li>Pray for Thailand Outreach</li>
		</ul>
	</div>
	<div class="col-md-6">
		<a href="newCommitment.cfm">new Commitment</a>
	</div>
</div>
<div class="col-md-4 col-md-offset-8">
	<a class="btn" href="Donate.cfm">New Donation</a>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>