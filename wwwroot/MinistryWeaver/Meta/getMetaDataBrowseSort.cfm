<cfscript>
response = new com.MetaData.BrowseSort().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>getMetaDataBrowseSort</h1>
<p> </p>

<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">BROWSEID</th>
			<th class="num">BROWSESORTID</th>
			<th class="num">ISDEFAULT</th>
			<th class="num">SORTASCENDING</th>
			<th>UIDISPLAY</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#BROWSEID#</td>
			<td class="num">#BROWSESORTID#</td>
			<td class="num">#ISDEFAULT#</td>
			<td class="num">#SORTASCENDING#</td>
			<td>#UIDISPLAY#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>