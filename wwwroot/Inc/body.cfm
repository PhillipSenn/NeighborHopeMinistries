<cfscript>
param name='Variables.fw.navbar' default='navbar-fixed-top';
param name='Variables.fw.container' default=true;
</cfscript>

</head>
<body>
<cfoutput>
<nav class="navbar-default #Variables.fw.navbar#">
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/" class="navbar-brand">#Application.fw.Name#</a>
			</div>
			<div class="collapse navbar-collapse">
				<cfif IsDefined('form.quickSearch')>
					<form method="post" action="/quickSearch/quickSearch.cfm" class="navbar-form navbar-right" role="form">
						<div class="form-group">
							<input name="quickSearch" placeholder="#form.quickSearch#" class="form-control">
						</div>
						<button type="submit" class="btn-normal glyphicon glyphicon-search"> </button>
					</form>
				<cfelse>
					<cfif IsDefined("session.User.UserSessionID")>
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a id="navUsrName" href="JavaScript:" class="dropdown-toggle" data-toggle="dropdown">
								#session.User.UserSessionID#
								<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="/User/Profile.cfm">Profile</a></li>
									<li><a href="/?logout">Logout</a></li>
								</ul>
							</li>
						</ul>
					<cfelse>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="##" data-toggle="modal" data-target=".modal">Login</a></li>
							<li><a href="/Register/Register.cfm">Register</a></li>
						</ul>
					</cfif>
				</cfif>
			</div>
		</div>
	</div>
	<div id="msg" class="container<cfif request.fw.msg NEQ ''> #request.fw.msgClass#</cfif>">
		#request.fw.msg#
	</div>
</nav>
<section id="main" class="<cfif Variables.fw.Container>container<cfelse>noContainer</cfif>"
<cfif request.fw.hidden && request.fw.css && request.fw.js> hidden</cfif>>
</cfoutput>
