<cfscript>
response = new com.MetaData.Forms().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataForms</h1>
<p></p>
<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">ClassFormID</th>
			<th class="num">ClassID</th>
			<th>Name</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#ClassFormID#</td>
			<td class="num">#ClassID#</td>
			<td>#Name#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>