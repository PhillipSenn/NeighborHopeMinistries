<cfscript>
response = new com.MetaData.Associations().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataAssociations</h1>
<p>Get the MetaData to populate the Browser's Connection ComboBox</p>
<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">ClassID</th>
			<th class="num">AssociationID</th>
			<th>Name</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#AssociationID#</td>
			<td class="num">#ClassID#</td>
			<td>#Name#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
	<div id="recordCount">
		RecordCount: #response.qry.recordCount#.
	</div>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>