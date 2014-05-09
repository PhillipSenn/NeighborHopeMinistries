<cfscript>
response = new com.MetaData.ObjectValidStates().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataObjectValidStates</h1>
<p></p>

<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">CurrentStateID</th>
			<th>Name</th>
			<th class="num">NextStateID</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#CurrentStateID#</td>
			<td>#Name#</td>
			<td class="num">#NextStateID#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>