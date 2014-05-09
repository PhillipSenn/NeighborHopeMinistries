<!--- Copy this into the /Inc/body.cfm --->
<cfparam name="request.msg" default="">
<cfif IsDefined("request.fw0.Container") && request.fw0.Container>
	<cfoutput>
	<div class="msg container">
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section class="container" id="xhrResponse">
<cfelse>
	<cfoutput>
	<div class="msg">
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section id="xhrResponse">
</cfif>
<!--- Because /Inc/foot.cfm needs to have the </section> tag. --->