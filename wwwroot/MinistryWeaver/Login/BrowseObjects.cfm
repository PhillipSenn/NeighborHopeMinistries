<cfscript>
response = new Objects().browseObjects()
request.fw.container = false
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<table>
	<thead>
		<tr>
			<th class="num">Alert</th>
			<th class="num">CanOpen</th>
			<th class="groupby">ClassName</th>
			<th class="date">Created</th> <!--- Date means sort by data-date --->
			<th>DESCRIPT</th>
			<th class="num groupby">ENGAGEMENT</th>
			<th class="num">ENGAGEMENTVALUE</th>
			<th class="num">FAVORITE</th>
			<th class="num">ISCHANGED</th>
			<th class="num">ISNEW</th>
			<th class="date">LASTACCESSED</th>
			<th>LASTACCESSEDDESCRIPTION</th>
			<th>LASTSOURCECODE</th>
			<th class="num">LASTTXAMOUNT</th>
			<th class="date">LASTTXDATE</th>
			<th class="num">LEGACYCODE</th>
			<th>LOCATION</th>
			<th class="num">MAXTX</th>
			<th class="date">MODIFIED</th>
			<th>NAME</th>
			<th>OBJECTCODE</th>
			<th class="num">OBJECTID</th>
			<th>REGION</th>
			<th class="num">ROWCOUNT</th>
			<th>SEGMENTLIST</th>
			<th>SOURCECODE</th>
			<th class="num">TOTALTX</th>
			<th class="num">VERSION</th>
			<th class="num">YTDTX</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="response.qry">
			<tr>
				<td class="num">#Alert#</td>
				<td class="num">#CanOpen#</td>
				<td>#ClassName#</td>
				<td data-date="#DateTimeFormat(Created,'yyyymmdd.HHnnsslll')+0#" class="num">
				#DateFormat(Created,'mm/dd/yyyy')#<br>#TimeFormat(Created,"hh:nn:sstt")#</td> <!--- mmddyyyy_hhnnsstt(Created) --->
				<td>#DESCRIPT#</td>
				<td class="num">#ENGAGEMENT#</td>
				<td class="num">#ENGAGEMENTVALUE#</td>
				<td class="num">#FAVORITE#</td>
				<td class="num">#ISCHANGED#</td>
				<td class="num">#ISNEW#</td>
				<td class="date">#LASTACCESSED#</td>
				<td>#LASTACCESSEDDESCRIPTION#</td>
				<td>#LASTSOURCECODE#</td>
				<td class="num">#LASTTXAMOUNT#</td>
				<td class="date" data-date="#DateFormat(LASTTXDATE,'yyyymmdd')#">#LASTTXDATE#</td>
				<td class="num">#LEGACYCODE#</td>
				<td>#LOCATION#</td>
				<td class="num">#MAXTX#</td>
				<td class="date" data-date="#DateTimeFormat(MODIFIED,'yyyymmdd.HHnnsslll')+0#">
				#DateFormat(MODIFIED,'mm/dd/yyyy')#<br>#TimeFormat(MODIFIED,"hh:nn:sstt")#
				</td>
				<td>#NAME#</td>
				<td>#OBJECTCODE#</td>
				<td class="num">#OBJECTID#</td>
				<td>#REGION#</td>
				<td class="num">#ROWCOUNT#</td>
				<td>#SEGMENTLIST#</td>
				<td>#SOURCECODE#</td>
				<td class="num">#TOTALTX#</td>
				<td class="num">#VERSION#</td>
				<td class="num">#YTDTX#</td>
			</tr>
		</cfloop>
	</tbody>
</table>

<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>