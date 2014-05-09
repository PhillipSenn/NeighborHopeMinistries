<cfscript>
response = new com.MetaData.States().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataStates</h1>
<p>get the MetaData to populate the Browser's State Combobox </p>
<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">ClassID</th>
			<th class="num">isDefault</th>
			<th class="num">isInactive</th>
			<th>Name</th>
			<th class="num">StateID</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#ClassID#</td>
			<td class="num">#isDefault#</td>
			<td class="num">#isInactive#</td>
			<td>#Name#</td>
			<td class="num">#StateID#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>