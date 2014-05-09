<cfscript>
param name="form.name" type="string" default="John Doe";
param name="form.email" type="string" default="JohnDoe@gmail.com";
param name="form.donation" type="numeric" default="1";

if (IsDefined('form.Save')) {
	if (!Len(form.name)) {
		request.fw.msg = 'Neighbor Hope Ministries custom msg: Please enter your name.'
	}
	if (!isValid('email', form.email)) {
		request.fw.msg = 'Neighbor Hope Ministries custom msg: Please enter a valid Email.'
	}
	if (form.donation < 1) {
		request.fw.msg = 'Neighbor Hope Ministries custom msg: Please select a donation.'
	}
	if (IsDefined('form.stripeToken')) {
		if (!Len(form.stripeToken)) {
			request.fw.msg = 'Neighbor Hope Ministries custom msg: Something went wrong with your credit card information. Please double-check it.'
		}
	} else {
		request.fw.msg = 'Neighbor Hope Ministries custom msg: Missing form.stripeToken.'
	}
	// Check to see if we are using asynchronous validation of the form. If so, let's just return an "API" result rather than fully processing the form data.
	if (IsDefined('form.validateOnly')) {
		result.msg = request.fw.msg
		resultJSON = serializeJSON(result)
	}
}
</cfscript>

<cfif IsDefined('form.Save')>
	<cfif IsDefined('form.validateOnly')>
		<cfcontent type="text/x-application-json" variable="#toBinary( toBase64( resultJSON ) )#" />
		<!--- NOTE: API processing has been halted. --->
	</cfif>
	<!---
	If we made it this far, we are doing server-side processing.
	--->
	<cfif request.fw.msg EQ ''>
		<cfinclude template="/Passwords/Stripe.cfm">
		<cfhttp 
			method="post"
			url="https://api.stripe.com/v1/charges"
			username="#Stripe.SecretKey#">
			<cfhttpparam type="formfield" name="amount" value="#form.donation * 100#">	<!--- Our donation amount (in cents). --->
			<cfhttpparam type="formfield" name="currency" value="usd">
			<cfhttpparam type="formfield" name="card" value="#form.stripeToken#"> <!--- This was populated by myCallback --->
			<!--- A description of the transaction to show up in OUR records for tracking purposes. It is considered a good practice to add the Email address here in order to follow up if necessary. --->
			<cfhttpparam type="formfield" name="description" value="Testing the Stripe.com API. (#form.email#).">
		</cfhttp>
		<!--- Deserialize the result. --->
		<cfset result = deserializeJSON( cfhttp.fileContent )>
		<cfif IsDefined('result.error')>
			<cfset request.fw.msg = "Neighbor Hope Ministries custom msg: Unexpected error with cfhttp request.">
		<cfelse>
			<cflocation url="success.cfm" addtoken="false">
		</cfif>
	</cfif>
</cfif>

<!--- Reset the content buffer. --->
<cfcontent type="text/html; charset=utf-8">

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="PhillipSenn.css">
<cfinclude template="/Inc/body.cfm">
<h1> Accepting Online Payments With Stripe </h1>
<form method="post">
	<!---
	This is the Stripe token. It holds a one-use-only
	value that can be used to charge the given credit
	card a given amount. Once we pass the credit card
	info to the Stripe site (note: PCI comppliance),
	we will get a token in return.
	--->
	<input type="hidden" name="stripeToken">
	<label for="name">Name:</label>
	<input id="name" name="name" value="#HTMLEditFormat( form.name )#" size="20">
	<label for="Email">Email:</label>
	<input type="text" id="Email" name="Email" value="#HTMLEditFormat( form.email )#" size="20">
	<label for="Donation">Donation:</label>
	<select id="Donation" name="donation">
		<option value="1">$1</option>
		<option value="2">$2</option>
		<option value="3">$3</option>
		<option value="4">$4</option>
		<option value="5">$5</option>
	</select>

	<label for="creditCard">Credit Card:</label>
	<input id="creditCard" value="4242424242424242" size="20" class="creditCard">
	<label for="expirationMonth">Expiration:</label>
	<input id="expirationMonth" size="5" class="expirationMonth" value="12">
	<input id="expirationYear" size="5" class="expirationYear" value="2015"> <em>(MM/YYYY)</em>
	<label for="securityCode">Security Code:</label>
	<input id="securityCode" size="5" class="securityCode" value="1234">
	<p>
		<button name="Save" type="submit">Make A Donation!</button>
	</p>
</form>
<cfinclude template="/Passwords/Stripe.cfm">
<div id="PublishableKey">#Stripe.PublishableKey#</div>
<div id="SCRIPT_NAME">#cgi.SCRIPT_NAME#</div>
<a href="http://www.bennadel.com/blog/2286-Accepting-PCI-Compliant-Payments-Without-A-Merchant-Account-Using-Stripe-And-ColdFusion.htm">Blog post</a>
<cfinclude template="/Inc/foot.cfm">
<script src="https://js.stripe.com/v1/"></script>
<script src="PhillipSenn.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>