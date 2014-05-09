(function() {
	Stripe.setPublishableKey($('#PublishableKey').text())

	$(document).on('submit','form',StripeFormSubmitted)
	
	function StripeFormSubmitted(myEvent) {
		var local = {}

		myEvent.preventDefault() // Contact the Stripe API before truly submitting the form.
		// Ask Stripe to create a token
		local.number = $('#creditCard').val()
		local.exp_month = $('#expirationMonth').val()
		local.exp_year = $('#expirationYear').val()
		local.cvc = $('#securityCode').val()
		Stripe.createToken(
			 local
			,$('select[name=donation]').val() * 100
			,myCallback
		)
	}
	
	function myCallback( status, response ) {
		var local = {}

		if (response.hasOwnProperty( "error" )){
			$('#msg').text(response.error.message).addClass('label-danger')
			return
		}
		
		$('input[name=stripeToken]').val(response.id)
		
		// Now, let's validate our non-stripe data by submitting the form with validateOnly
		local.type = 'post'
		local.url = $('#SCRIPT_NAME').text()
		local.dataType = 'json'
		local.data = {}
		local.data.Save = 'async'
		local.data.validateOnly = true
		local.data.name = $('input[name=name]').val()
		local.data.email = $('input[name=email]').val()
		local.data.donation = $('select[name=donation]').val()
		local.data.stripeToken = response.id
		local.Promise = $.ajax(local)
		local.Promise.done(done)
		
		function done(response) {	// Check the validate asynchronous response.
			if (response.msg) {
				$('#msg').text(response.msg).addClass('label-danger')
			} else {
				// Both the stripe API call and the local server validation worked. 
				$(document).off('submit','form') // Unbind any form handlers
				$('button[name=Save]').click() //  and then submit the form again.
			}
		}
	}
})();


