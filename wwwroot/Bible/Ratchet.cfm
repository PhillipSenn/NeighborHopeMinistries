<cfscript>
Verse = new com.Verse().Where("BookSort",1)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/Ratchet/html.cfm">
<cfinclude template="/Inc/Ratchet/body.cfm">
<div class="slider" id="mySlider">
	<div class="slide-group">
		<cfloop query="Verse.qry" endrow="3">
			<div class="slide">
				<img src="http://goratchet.com/assets/img/slide-#currentRow#.jpg">
				<span class="slide-text">
					<span class="icon icon-left-nav"></span>
					#VerseName#
				</span>
			</div>
		</cfloop>
	</div>
</div>
<!--
<div class="slider" id="mySlider">
	<div class="slide-group">
		<cfloop query="Verse.qry">
			<div class="slide">
				<h1>#VerseSort#</h1>
				#VerseName#
			</div>
		</cfloop>
	</div>
</div>
-->
<cfinclude template="/Inc/Ratchet/foot.cfm">
<script src="/ratchet/js/sliders.js"></script>
<script src="Ratchet.js"></script>
<cfinclude template="/Inc/Ratchet/End.cfm">
</cfoutput>
