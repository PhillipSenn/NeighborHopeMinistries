component {
Variables.Datasource = "PaulNielsen"

function Where() {
	local.result = {}
	try {
		storedproc 
		procedure='app.GetErrorCodes' 
		returncode="yes" 
		result="local.result.Prefix" 
		datasource="#Variables.Datasource#" {
			procresult name="local.result.qry";
		}
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}

function GetErrorCodeX() {
	local.result = {}
	try {
		storedproc 
		procedure='app.GetErrorCodeX' 
		returncode="yes" 
		result="local.result.Prefix"
		datasource="#Variables.Datasource#" {
			procresult name="local.result.qry";
		}
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}
}