component {

function WhereTableType(form) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA
	,INFORMATION_SCHEMA.COLUMNS.TABLE_NAME as tableName
	,COUNT(*) AS Columns
	FROM INFORMATION_SCHEMA.COLUMNS
	JOIN INFORMATION_SCHEMA.TABLES
	ON INFORMATION_SCHEMA.COLUMNS.TABLE_CATALOG = INFORMATION_SCHEMA.TABLES.TABLE_CATALOG
	AND INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA = INFORMATION_SCHEMA.TABLES.TABLE_SCHEMA
	AND INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = INFORMATION_SCHEMA.TABLES.TABLE_NAME
	WHERE TABLE_TYPE='#form.TableType#'
	";
	if (IsDefined('form.tableSchema')) {
		local.sql &= "AND INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA='#form.tableSchema#'";
	}
	local.sql &="
	GROUP BY INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA,INFORMATION_SCHEMA.COLUMNS.TABLE_NAME
	ORDER BY INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA,Replace(INFORMATION_SCHEMA.COLUMNS.TABLE_NAME,'View','')
	";
	include "/Inc/execute.cfm";
	return local.result;
}

function WhereTableName(form) {
	include "/Inc/newQuery.cfm";
	local.sql = "
	SELECT *
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = '#form.TableName#'
	ORDER BY ORDINAL_POSITION
	";
	include "/Inc/execute.cfm";
	return local.result;
}

}
