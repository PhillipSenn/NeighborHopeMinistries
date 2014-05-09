<cfscript>

</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<div class="col-md-3">
	<table>
		<thead>
			<tr>
				<th>Alpha</th>
				<th>Same</th>
				<th class="num">Numeric</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>A</td>
				<td>Z</td>
				<td class="num">1</td>
			</tr>
			<tr>
				<td>B</td>
				<td>Z</td>
				<td class="num">2</td>
			</tr>
		</tbody>
	</table>
</div>
<cfdump var="#request#">
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>