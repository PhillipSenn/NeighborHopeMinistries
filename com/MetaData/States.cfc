component {
Variables.Datasource = "PaulNielsen"

function Where(procedure) {
	local.result = {}
	try {
		storedproc procedure='app.GetMetaDataStates' result="local.result.Prefix" returncode="yes"
		datasource="#Variables.Datasource#" {
			procresult name="local.result.qry";
		}
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}
}