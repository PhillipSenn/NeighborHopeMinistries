<cfscript>
response = new com.MetaData.Attributes().Where()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<h1>GetMetaDataAttributes</h1>
<p></p>

<cfif IsDefined("response.qry")>
	<table>
	<thead>
		<tr>
			<th class="num">ATTRIBUTEID</th>
			<th>ATTRIBUTELABEL</th>
			<th>ATTRIBUTENAME</th>
			<th>CLASS</th>
			<th class="num">CLASSID</th>
			<th>DATATYPE</th>
			<th>DEFAULTVALUE</th>
			<th>FKREFERENCESCLASSID</th>
			<th>ISREQUIRED</th>
			<th>MAXVALUE</th>
			<th>MINVALUE</th>
			<th>UIBATCHENTRY</th>
			<th>UICONTROL</th>
			<th>UICONTROLWIDTH</th>
			<th>UIMASK</th>
			<th>UISORTORDER</th>
			<th>VALIDATIONMETHOD</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="response.qry">
		<tr>
			<td class="num">#ATTRIBUTEID#</td>
			<td>#ATTRIBUTELABEL#</td>
			<td>#ATTRIBUTENAME#</td>
			<td>#CLASS#</td>
			<td class="num">#CLASSID#</td>
			<td>#DATATYPE#</td>
			<td>#DEFAULTVALUE#</td>
			<td>#FKREFERENCESCLASSID#</td>
			<td>#ISREQUIRED#</td>
			<td>#MAXVALUE#</td>
			<td>#MINVALUE#</td>
			<td>#UIBATCHENTRY#</td>
			<td>#UICONTROL#</td>
			<td>#UICONTROLWIDTH#</td>
			<td>#UIMASK#</td>
			<td>#UISORTORDER#</td>
			<td>#VALIDATIONMETHOD#</td>
		</tr>
	</cfloop>
	</tbody>
	</table>
</cfif>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>