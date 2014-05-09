component {
Variables.Datasource = "PaulNielsen"

function Where() {
	local.result = {}
	try {
		storedproc procedure="app.GetMetaDataAssociations" result="local.result.Prefix" returncode="yes"
		datasource="#Variables.Datasource#" {
			procresult name="local.result.qry";
		}
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}
}
