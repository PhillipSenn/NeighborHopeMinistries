<cfscript>
form.VersionSort=1
KJV = new Bible().EntireBible(form)
form.VersionSort=2
NASB = new Bible().EntireBible(form)
request.fw.section=false
</cfscript>

<cfoutput>
<cfinclude template="/Inc/jqm/html.cfm">
<link rel="stylesheet" href="Bible.css">
<cfinclude template="/Inc/jqm/body.cfm">
<cfloop query="KJV.qry">
	<section id="#BookName#-#Chapter#-#VerseSort#">
		<header>
			<cfif CurrentRow EQ 1>
				<!--
				<a class="prev" href="Bible.cfm" data-ajax="false">Reload</a>
				-->
				<h1>The Bible</h1>
				<a class="next ui-btn-right ui-btn-icon-right ui-icon-carat-r" href="###BookName#-#Chapter#-#VerseSort+1#">#Chapter#:#VerseSort+1#</a>
			<cfelseif CurrentRow EQ Recordcount>
				<a class="prev ui-btn-icon-left ui-icon-carat-l" href="###BookName#-#Chapter#-#VerseSort-1#">#Chapter#:#VerseSort-1#</a>
				<h1>#BookName# #Chapter#:#VerseSort#</h1>
			<cfelse>
				<a class="prev ui-btn-icon-left ui-icon-carat-l" href="###BookName#-#Chapter#-#VerseSort-1#">#Chapter#:#VerseSort-1#</a>
				<h1>#BookName# #Chapter#:#VerseSort#</h1>
				<a class="next ui-btn-icon-right ui-icon-carat-r" href="###BookName#-#Chapter#-#VerseSort+1#">#Chapter#:#VerseSort+1#</a>
			</cfif>
		</header>
		<article>
			<p class="NASBVerse">#NASBVerse#</p>
			<p class="KJVVerse" hidden>#KJVVerse#</p>
		</article>
		<footer data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="##" class="NASB btn-primary">NASB</a></li>
					<li><a href="##" class="KJV">KJV</a></li>
					<li><a href="##" class="SpoudazoSort"></a></li>
				</ul>
			</div>
		</footer>
		<input type="hidden" name="VerseID" value="#VerseID#">
	</section>
</cfloop>
<cfinclude template="/Inc/jqm/foot.cfm">
<script src="Bible.js"></script>
<cfif IsDefined('session.Person')>
	<script src="ajax.js"></script>
</cfif>
<cfinclude template="/Inc/jqm/End.cfm">
</cfoutput>
