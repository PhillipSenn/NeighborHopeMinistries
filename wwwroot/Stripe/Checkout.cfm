<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<form action="" method="POST">
<script
src="https://checkout.stripe.com/checkout.js" class="stripe-button"
data-key="pk_WznRi8GtzXtfMu9Kv2j23FCrlLTpO"
data-amount="1"
data-name="Demo Site"
data-description="1 cent ($0.01)"
data-image="/128x128.png">
</script>
</form>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>