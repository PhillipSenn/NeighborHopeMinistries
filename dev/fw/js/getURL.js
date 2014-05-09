var getURL = function(argument) {
	var local = {};
	local.result = '';
	local.hashes = location.href.slice(
		location.href.indexOf('?') + 1
	).split('&');
	for(var i = 0; i < local.hashes.length; i++)	{
		local.hash = local.hashes[i].split('=');
		if (local.hash[0].toUpperCase() === argument.toUpperCase()) {
			local.result = local.hash[1]
		}
	}
	return local.result;
}