<cfscript>
LastName = new frozenRow().Top1000();
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<link rel="stylesheet" href="frozenRow.css">
<cfinclude template="/Inc/body.cfm">
<div id="myWindow">
	<table>
		<thead>
			<tr>
				<th class="num">Row</th>
				<th>Last Name</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="LastName.qry">
				<tr>
					<td class="num">#CurrentRow#</td>
					<td>#LastName#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</div>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>