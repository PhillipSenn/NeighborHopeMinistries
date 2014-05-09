<cfscript>
response = new oldSchool().browseActivity()

request.fw.container = false
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<cfdump var="#response#">
<cfabort>
<table>
	<thead>
		<tr>
			<th class="date">Activity Date</th>
			<th>User Name</th>
			<th class="num">RowCount</th>
			<th class="num">ObjectID</th>
			<th>ObjectCode</th>
			<th>ClassString</th>
			<th>NameView</th>
			<th>Location</th>
			<th>Type</th>
			<th>ActivityDescription</th>
			<th class="num">DetailID</th>
			<th>TriggerPK</th>
			<th>Name</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="response.qry">
			<tr>
				<td data-date="#DateTimeFormat(ActivityDate,'yyyymmdd.HHnnsslll')+0#" class="date">
				#DateFormat(ActivityDate,'mm/dd/yyyy')#<br>#TimeFormat(ActivityDate,"hh:nn:sstt")#</td>
				<td>#UserName#</td>
				<td class="num">#RowCount#</td>
				<td class="num">#ObjectID#</td>
				<td>#ObjectCode#</td>
				<td>#ClassString#</td>
				<td>#NameView#</td>
				<td>#Location#</td>
				<td>#Type#</td>
				<td>#ActivityDescription#</td>
				<td class="num">#DetailID#</td>
				<td>#TriggerPK#</td>
				<td>#Name#</td>
			</tr>
		</cfloop>
	</tbody>
</table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>
