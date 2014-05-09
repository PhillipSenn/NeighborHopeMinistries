<cfparam name="form.submitted" type="boolean" default="false">
<cfparam name="form.name" type="string" default="John Doe">
<cfparam name="form.email" type="string" default="JohnDoe@gmail.com">
<cfparam name="form.donation" type="numeric" default="1">
<cfparam name="form.stripeToken" type="string" default="">
<!--- A flag for validation-only requests (for AJAX). --->
<cfparam name="form.validateOnly" type="boolean" default="false">
<cfset errors = []>
<cfif form.submitted>
	<cfif NOT len( form.name )>
		<cfset arrayAppend( errors, "Please enter your name." )>
	</cfif>
	<cfif NOT isValid( "email", form.email )>
		<cfset arrayAppend( errors, "Please enter a valid Email." )>
	</cfif>
	<cfif (form.donation lt 1)>
		<cfset arrayAppend( errors, "Please select a donation." )>
	</cfif>
	<cfif NOT len( form.stripeToken )>
		<cfset arrayAppend( errors, "Something went wrong with your credit card information. Please double-check it." )>
	</cfif>
	<!---
		Check to see if we are using asynchronous validation of the
		form. If so, let's just return an "API" response rather than
		fully processing the form data.
	--->
	<cfif form.validateOnly>
		<!--- Check to see if there are any errors. --->
		<cfset response = {}>
		<cfif arrayLen( errors )>
			<cfset response["success"] = false>
			<cfset response["errors"] = errors>
		<cfelse>
			<cfset response["success"] = true>
		</cfif>
		<!--- Serialize the response. --->
		<cfset responseJSON = serializeJSON( response )>
		<!--- Return the API response. --->
		<cfcontent type="text/x-application-json" variable="#toBinary( toBase64( responseJSON ) )#" />
		<!--- NOTE: API processing has been halted. --->
	</cfif>
	<!---
	If we made it this far, we are doing server-side processing.
	--->
	<cfif NOT arrayLen( errors )>
		<cftry>
			<cfhttp 
				result="myHttpResult" 
				method="post"
				url="https://api.stripe.com/v1/charges"
				username="#Application.Stripe.Test.SecretKey#"
				password="">
				<!--- Our donation amount (in cents). --->
				<cfhttpparam type="formfield" name="amount" value="#(form.donation * 100)#">
				<cfhttpparam type="formfield" name="currency" value="usd">
				<cfhttpparam type="formfield" name="card" value="#form.stripeToken#"> <!--- This was populated by myCallback --->
				<!---
					A description of the transaction to show up in
					OUR records for tracking purposes. It is
					considered a good practice to add the Email
					address here in order to follow up if necessary.
				--->
				<cfhttpparam type="formfield" name="description" value="Testing the Stripe.com API. (#form.email#).">
			</cfhttp>
			<!--- Deserialize the response. --->
			<cfset result = deserializeJSON( myHttpResult.fileContent )>
			<cfif structKeyExists( result, "error" )>
				<cfset arrayAppend(errors,result.error.message)>
				<cfthrow type="InvalidRequestError">
			</cfif>
			<cflocation url="success.cfm" addtoken="false">
			<cfcatch type="InvalidRequestError">
			</cfcatch>
			<cfcatch>
				<cfset arrayAppend(errors,"There was an unexpected error during the processing of your purchase. The error has been logged and our team is looking into it.")>
			</cfcatch>
		</cftry>
	</cfif>
</cfif>

<!--- Reset the content buffer. --->
<cfcontent type="text/html; charset=utf-8">

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" type="text/css" href="BenNadel.css">
<cfinclude template="/Inc/body.cfm">
<h1> Accepting Online Payments With Stripe </h1>
<cfif form.submitted AND arrayLen( errors )>
	<h3> Please review the following: </h3>
	<ul>
		<cfloop index="error" array="#errors#">
			<li> #error# </li>
		</cfloop>
	</ul>
</cfif>
<form method="post">
	<input type="hidden" name="submitted" value="true">
	<!---
	This is the Stripe token. It holds a one-use-only
	value that can be used to charge the given credit
	card a given amount. Once we pass the credit card
	info to the Stripe site (note: PCI comppliance),
	we will get a token in return.
	--->
	<input type="hidden" name="stripeToken" value="">
	<label for="name">Name:</label>
	<input type="text" id="name" name="name" value="#htmlEditFormat( form.name )#" size="20">
	<label for="Email">Email:</label>
	<input type="text" id="Email" name="Email" value="#htmlEditFormat( form.email )#" size="20">
	<label for="Donation">Donation:</label>
	<select id="Donation" name="donation">
		<option value="1">$1</option>
		<option value="2">$2</option>
		<option value="3">$3</option>
		<option value="4">$4</option>
		<option value="5">$5</option>
	</select>
	<!---
	The user is going to enter their credit card
	information below. Notice that NONE of the credit-
	card fields have Name values. This will prevent them
	from being submitted to OUR server which is what we
	need to avoid in order to comply with PCI standards.
	--->
	<label for="creditCard">Credit Card:</label>
	<input id="creditCard" value="4242424242424242" size="20" class="creditCard">
	<label for="expirationMonth">Expiration:</label>
	<input id="expirationMonth" size="5" class="expirationMonth" value="12">
	<input id="expirationYear" size="5" class="expirationYear" value="2015"> <em>(MM/YYYY)</em>
	<label for="securityCode">Security Code:</label>
	<input id="securityCode" size="5" class="securityCode" value="1234">
	<p>
		<button type="submit">Make A Donation!</button>
	</p>
</form>
<cfinclude template="/Passwords/Stripe.cfm">
<div id="PublishableKey">#Stripe.PublishableKey#</div>
<div id="SCRIPT_NAME">#cgi.SCRIPT_NAME#</div>
<a href="http://www.bennadel.com/blog/2286-Accepting-PCI-Compliant-Payments-Without-A-Merchant-Account-Using-Stripe-And-ColdFusion.htm">Blog post</a>
<cfinclude template="/Inc/foot.cfm">
<script type="text/javascript" src="https://js.stripe.com/v1/"></script>
<script src="BenNadel.js"></script>
<cfinclude template="/Inc/End.cfm">
</cfoutput>