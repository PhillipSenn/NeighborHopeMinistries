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

<cfinclude template="/fw/foot.cfm">

<cfif request.fw.js>
	<script src="/Inc/dom.js"></script>
</cfif>

</cfoutput>