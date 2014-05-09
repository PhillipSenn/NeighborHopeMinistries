<cfscript>
response = new com.MetaData.ClassForm().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataClassForm</h1>
<p></p>
<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th>ClassFormName</th>
			<th class="num">ClassID</th>
			<th class="num">EngagementDefault</th>
			<th class="num">EngagementMax</th>
			<th class="num">EngagementMin</th>
			<th class="num">isClassUniversal</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td>ClassFormName</td>
			<td class="num">#ClassID#</td>
			<td class="num">#EngagementDefault#</td>
			<td class="num">#EngagementMax#</td>
			<td class="num">#EngagementMin#</td>
			<td class="num">#isClassUniversal#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>