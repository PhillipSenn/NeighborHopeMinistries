<cfscript>
if (IsDefined('url.tableName')) {
	Columns = new com.Information_Schema().WhereTableName(url);
	Data = new TableExplorer().WhereTableName(url);
}
form.tableType = 'BASE TABLE';
Tables = new com.Information_Schema().WhereTableType(form);
form.tableType = 'VIEW';
Views = new com.Information_Schema().WhereTableType(form);
request.Bootstrap.container = false;
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<div class="row">
	<div class="col-md-2 col-md-offset-8">
		<table>
			<thead>
				<tr>
					<th>Tables</th>
					<th class="num">Columns</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="Tables.qry">
					<tr>
						<td><a href="TableExplorer.cfm?tableName=#tableName#">#tableName#</a></td>
						<td class="num">#Columns#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
	<div class="col-md-2">
		<table>
			<thead>
				<tr>
					<th>Views</th>
					<th class="num">Columns</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="Views.qry">
					<tr>
						<td><a href="TableExplorer.cfm?tableName=#tableName#">#tableName#</a></td>
						<td class="num">#Columns#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
		</ul>
	</div>
</div>
<cfif IsDefined('url.tableName')>
	<div class="row">
		<table>
			<thead>
				<tr>
					<cfloop query="Columns.qry">
						<cfset myClass = Data_Type>
						<cfif Data_Type EQ "int">
							<cfset myClass &= " num">
						</cfif>
						<cfset DataType = Data_Type>
						<cfif DataType EQ "varchar">
							<cfset DataType &= '(' & Character_Maximum_Length & ')'>
						</cfif>
						<cfif Find('_',Column_Name)>
							<cfset ColumnName = ListGetAt(Column_Name,2,'_')>
						<cfelse>
							<cfset ColumnName = Column_Name>
						</cfif>
						<cfif Left(ColumnName,Len(TableName)) EQ TableName>
							<cfset ColumnName = Mid(ColumnName,Len(TableName)+1,99)>
						</cfif>
						<th class="#myClass#" title="#dataType#">#ColumnName#</th>
					</cfloop>
				</tr>
			</thead>
			<tbody>
				<cfloop query="data.qry">
					<tr>
						<cfloop query="Columns.qry">
							<cfset X = Evaluate("data.qry.#Column_Name#")>
							<cfset myClass = Data_Type>
							<cfif Data_Type EQ "int">
								<cfset myClass &= " num">
							</cfif>
							<td class="#myClass#">#X#</td>
						</cfloop>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>