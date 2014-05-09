<cfscript>
param name="request.fw.navbar" default="navbar-fixed-top"; // none | navbar-fixed-top | navbar-fixed-bottom | navbar-static-top | ""
param name="request.fw.Container" default=true;
</cfscript>

<cfoutput>
<title>#Application.fw.Name#</title>
</head>
<body>
<cfif request.fw.navbar NEQ "none">
	<nav class="#request.fw.navbar#">
		<div class="navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="active navbar-brand" href="/">MinistryWeaver.</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="http://www.PhillipSenn.com">PhillipSenn.com</a></li>
				</ul>
				<cfif IsDefined('form.quickSearch')>
					<div class="navbar-collapse collapse">
						<form method="post" action="/quickSearch/quickSearch.cfm" class="navbar-form navbar-right" role="form">
							<div class="form-group">
								<input name="quickSearch" placeholder="#form.quickSearch#" class="form-control">
							</div>
							<button type="submit" class="btn-normal glyphicon glyphicon-search"> </button>
						</form>
					</div>
				<cfelse>
					<div class="collapse navbar-collapse" id="collapse">
						<cfif IsDefined("session.User.UserSessionID")>
							<ul class="nav navbar-nav navbar-right">
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
					</div>
				</cfif>
			</div>
			<div id="msg"<cfif request.fw.msg NEQ ''> class="#request.fw.msgClass#"</cfif>>
				#request.fw.msg#
			</div>
		</div>
	</nav>
<cfelse>
	<div class="msg">
		<span id="failStatus"></span>
		<span id="errorThrown"></span>
		<span id="msg">#request.fw.msg#</span>
	</div>
</cfif>
<cfif request.fw.Container>
	<section class="container" id="main">
<cfelse>
	<section id="main">
</cfif>
</cfoutput>

