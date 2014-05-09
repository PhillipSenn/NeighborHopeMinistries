<cfscript>
response = new com.MetaData.ClassTree().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataClassTree</h1>
<cfif IsDefined("response.qry")>
	<table>
		<thead>
			<tr>
				<th class="num">ClassID</th>
				<th>ClassName</th>
				<th class="num">Parent ClassID</th>
			</tr>
		</thead>
		<tbody>
		<cfloop query="response.qry">
			<tr>
				<td class="num">#ClassID#</td>
				<td>#ClassName#</td>
				<td class="num">#ParentClassID#</td>
			</tr>
		</cfloop>
		</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>