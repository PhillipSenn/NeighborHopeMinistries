<cfscript>
response = new com.MetaData.RegionTree().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataRegionTree</h1>
<p>get the MetaData to popualte the Browser's Region Treeview</p>
<cfif IsDefined("response.qry")>
	<table>
		<thead>
			<tr>
				<th class="num">ParentRegionID</th>
				<th class="num">RegionID</th>
				<th>RegionName</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="response.qry">
				<tr>
					<td class="num">#ParentRegionID#</td>
					<td class="num">#RegionID#</td>
					<td>#RegionName#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>