<!--- All my domains on the hostek server --->
<cfif request.fw.js>
	<cfif request.fw.trackjs>
		<!-- https://my.trackjs.com/ -->
		<script src="//dl1d2m8ri9v3j.cloudfront.net/releases/1.2.4/tracker.js" data-customer="dd0a25975d834b84adb319238d164c9b"></script>
	</cfif>
	<cfif IsDefined('request.fw.jQueryUI')>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
	</cfif>
	<script src="/fw/fw.js"></script>
	<script src="/fw/bootstrap-3.1.1-dist/js/bootstrap.js"></script>
	<script src="/fw/js/consolelog.js"></script> <!--- patik.com/blog/complete-cross-browser-console-log --->
	<script src="/fw/js/consolelog.detailprint.js"></script>
</cfif>
