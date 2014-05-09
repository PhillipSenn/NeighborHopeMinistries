<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<div class="col-md-offset-3">
	John Smith
</div>
<hr>
Donation
<div class="row">
	<div class="col-md-3">
		Amount:
	</div>
	<div class="col-md-9">
		Designated for:
	</div>
</div>
<div class="row">
	<div class="col-md-3">
		<input name="Amount" type="number" value="25.00">
	</div>
	<div class="col-md-9">
		<select name="DonateFor">
			<option value="1">Wei Pei</option>
		</select>
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		<label>
		<input type="checkbox" name="Recurring">Monthly
		</label>
	</div>
</div>
	
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<input type="checkbox" value="1" name="cc" checked>Credit Card
	</div>
	<div class="col-md-3">
		<a href="##">online security</a>
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		<input type="checkbox" value="2" name="eft">Electronic Funds Transfer (eft)
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		Name as it appears on the Credit Card
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		<input name="Name">
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		Credit Card Number
	</div>
</div>
<div class="row">
	<div class="col-md-9 col-md-offset-3">
		<input name="ccNumber">
	</div>
</div>
<div class="row">
	<div class="col-md-4 col-md-offset-3">
		Expiration
	</div>
	<div class="col-md-5">
		Security Code
	</div>
</div>
<div class="row">
	<div class="col-md-1 col-md-offset-3">
		<input name="ExpMonth">
	</div>
	<div class="col-md-1">
		/
	</div>
	<div class="col-md-1">
		<input name="ExpYear">
	</div>
	<div class="col-md-5 col-md-offset-1">
		<input name="SecurityCode">
	</div>
</div>
<button type="submit" name="Save">Submit donation</button>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>