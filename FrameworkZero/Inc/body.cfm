<cfscript>
param request.fw0.navbar = "navbar-fixed-top";
param request.fw0.Container = true;
</cfscript>

<cfoutput>
<title>#GetFileFromPath(getPageContext().getRequest().getServletPath())# - Framework Zero</title>
<cfinclude template="/Library/fw0/body.cfm">
<cfif IsDefined("request.fw0.navbar")>
	<cfif request.fw0.navbar NEQ "none">
		<div class="navbar navbar-inverse #request.fw0.navbar#">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">PhillipSenn.com</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#Application.fw0.homeDir#">#Application.fw0.Name#</a></li>
						<li class="dropdown">
							<a href="JavaScript:;" class="dropdown-toggle" data-toggle="dropdown">Help 
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#Application.fw0.homeDir#About/About.cfm">About</a></li>
							</ul>
						</li>
						<cfif IsDefined("session.Usr.qry.isAdmin") && session.Usr.qry.isAdmin>
							<li><a href="#Application.fw0.homeDir#Admin/Admin.cfm">Admin</a></li>
						</cfif>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a id="navUsrName" href="JavaScript:;" class="dropdown-toggle" data-toggle="dropdown">
							<cfif IsDefined("session.Usr.qry.UsrName")>
							#session.Usr.qry.UsrName#
							</cfif>
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#Application.fw0.homeDir#Usr/Profile.cfm">Profile</a></li>
								<li><a href="#Application.fw0.homeDir#?logout">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</cfif>
<cfelse>
	<p>
		<a class="navbar-brand" href="#Application.fw0.homeDir#">#Application.fw0.Name#</a>
	</p>
</cfif>
</cfoutput>

<cfif IsDefined("request.fw0.Container") AND request.fw0.Container>
	<cfoutput>
	<div class="msg container">
		<span id="textStatus"></span>
		<span id="errorThrown"></span>
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section class="container" id="xhrResponse">
<cfelse>
	<cfoutput>
	<div class="msg"> <!--- height --->
		<span id="msg">#request.msg#</span>
	</div>
	</cfoutput>
	<section id="xhrResponse">
</cfif>

