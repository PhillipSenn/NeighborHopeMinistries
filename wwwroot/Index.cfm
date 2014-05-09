<cfscript>
setting showdebugoutput=false;
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<img src="Images/pict4.jpg">
<ul class="list-unstyled">
	<li><a href="Log/Log.cfm">Log</a></li>
	<li><a href="Err/Err.cfm">Error trapping</a></li>
	<li><a href="Stripe/PhillipSenn.cfm">Stripe payment</a></li>
	<li><a href="Todo/Todo.cfm">Todo</a></li>
	<li><a href="skype:echo123?call">Call the Skype Echo / Sound Test Service</a>
	<li><a href="https://wcp.hostek.com/">Hostek Control Panel</a></li>
	<!---
	Server:   ftp.NeighborHopeMinistries.com
	Username: NeighborHope
	Password: Qwerty
	--->
	<li><a href="Profile/Profile.cfm">Profile</a></li>
	<li><a href="Profile/Donate.cfm">Donate</a></li>
	<li><a href="MinistryWeaver/MinistryWeaver.cfm">Ministry Weaver</a></li>
	<li>Stripe
		<ul>
			<li><a href="https://manage.stripe.com/dashboard">dashbpoard</a></li>
			<li><a href="https://stripe.com/docs">Docs</a></li>
			<li><a href="https://stripe.com/docs/tutorials/dashboard">Tutorials</a></li>
		</ul>
	</li>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>