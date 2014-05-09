(function() {
	window.addEventListener('load', windowLoaded, false)
	function windowLoaded(myEvent) {
		window.applicationCache.addEventListener('updateready', updateReady, false)
		
		function updateReady(myEvent) {
			if (window.applicationCache.status == window.applicationCache.UPDATEREADY) {
				$('#main').html('<h1>Refreshing the page&hellip;</h1>').show() 
				// I might be hiding #main
				// and since this is for jQuery Mobile, I don't mind using jQuery to update the dom.
				setTimeout(reload,1000)
			}
		}
		function reload() {
			window.location.reload()
		}
	}
})()

$('body').removeAttr('hidden')