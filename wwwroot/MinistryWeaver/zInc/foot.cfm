	<cfoutput>
	<p id="executionTime">
		#GetTickCount()-request.fw.tickCount# <i>ms</i>
	</p>
	</cfoutput>
</section>
<cfoutput>
<cfif !IsDefined("session.User.UserSessionID")>
	<div class="modal fade">
		<div class="modal-dialog">
			<form method="post" class="modal-content" action="/Login/Login.cfm">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<label for="Email">Email:</label>
					<input name="Email" autofocus value="SA">
					<label for="Password">Password:</label>
					<input type="password" name="Password" value="MinistryWeaver">
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal">Cancel</button>
					<button type="submit">Done</button>
				</div>
			</form>
		</div>
	</div>
</cfif>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
<script src="/Inc/js/Bootstrap.ini.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="/Inc/dom.js"></script>
</cfoutput>