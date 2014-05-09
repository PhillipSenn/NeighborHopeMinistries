<cfscript>
response = new Login().Favorites()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th>ClassName</th>
			<th>Location</th>
			<th>Name</th>
			<th>ObjectCode</th>
			<th class="num">ObjectID</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="response.qry">
			<tr>
				<td>#ClassName#</td>
				<td>#Location#</td>
				<td>#Name#</td>
				<td>#ObjectCode#</td>
				<td class="num">#ObjectID#</td>
			</tr>
		</cfloop>
	</tbody>
</table>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>