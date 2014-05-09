component {

function exec(procedure) {
	local.result = {}
	try {
		storedproc procedure=arguments.procedure result="local.result.Prefix" returncode="yes" {
			procresult name="local.result.qry";
		}
	} catch(any Exception) {
		request.fw.msg = Exception.Detail
	}
	return local.result
}
}