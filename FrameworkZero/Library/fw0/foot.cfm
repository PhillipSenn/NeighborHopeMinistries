<cfscript>
param request.fw0.js = true;
param request.fw0.LogJS = false;
param request.fw0.LogUI = false;
param request.fw0.LogCFID = 0;
param request.fw0.TickCount = GetTickCount();
param request.fw0.Bootstrap = true;
</cfscript>

<cfoutput>
<cfif request.fw0.js>
	<cfif request.fw0.Bootstrap>
		<script src="#Library#fw0/js/Bootstrap.init.js"></script>
		<script src="#Library#fw0/foot.js"></script>
		<script src="#Library#fw0/js/sortable.js"></script>
		<script src="#Library#fw0/js/filterable.js"></script>
		<script src="/Library/Bootstrap3/dist/js/bootstrap.js"></script>
	</cfif>
	<cfif request.fw0.LogJS OR request.fw0.LogUI>
		<div hidden>
			<div id="LogCFID">#request.fw0.LogCFID#</div>
			<div id="homeDir">#Application.fw0.homeDir#</div>
			<div id="TickCount">#request.fw0.TickCount#</div>
			<cfif IsDefined("session.Usr.qry.UsrID")>
				<div id="LogJS_UsrID">#session.Usr.qry.UsrID#</div>
			</cfif>
		</div>
		<cfif request.fw0.LogJS>
			<script src="#Application.fw0.homeDir#Inc/LogJS.js"></script>
		</cfif>
		<cfif request.fw0.LogUI>
			<script src="#Application.fw0.homeDir#Inc/LogUI.js"></script>
		</cfif>
	</cfif>
</cfif>
</cfoutput>