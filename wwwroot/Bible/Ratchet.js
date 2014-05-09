document.querySelector('#mySlider').addEventListener('slide', myFunction)
function myFunction(myEvent) {
	console.log(myEvent.detail.slideNumber);
}

