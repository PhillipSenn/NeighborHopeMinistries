window.dom = {} // Document Object Model

window.dom.fail = function(xhr,status,response) {
	$('#failStatus').text(status + ': ')
	$('#errorThrown').text(response)
	$('#xhrResponse').html(xhr.responseText)
	debugger
}

