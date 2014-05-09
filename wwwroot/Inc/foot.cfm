	<cfoutput>
	<p id="executionTime">
		#GetTickCount()-request.fw.tickCount# <em>ms</em>
	</p>
	</cfoutput>
</section>
<cfoutput>
<cfif true>
<cfelseif !IsDefined("session.User.UserSessionID")>
	<div class="modal fade">
		<div class="modal-dialog">
			<form method="post" class="modal-content" action="/Login/footLogin.cfm">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<label for="Email">Email:</label>
					<input name="Email" autofocus value="norm">
					<label for="Password">Password:</label>
					<input type="password" name="Password" value="">
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal">Cancel</button>
					<button type="submit">Done</button>
				</div>
			</form>
		</div>
	</div>
</cfif>

<cfif request.fw.js>
	<script src="/Inc/isogram.js"></script>
	<cfif IsDefined('request.fw.jQueryUI')>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
	</cfif>
	<script src="/fw/fw.js"></script>
	<script src="/fw/bootstrap-3.1.1-dist/js/bootstrap.js"></script>
	<script src="/fw/js/consolelog.js"></script> <!--- patik.com/blog/complete-cross-browser-console-log --->
	<script src="/fw/js/consolelog.detailprint.js"></script>
	<script src="/Inc/dom.js"></script>
</cfif>
</cfoutput>