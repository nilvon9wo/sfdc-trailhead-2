var map;

google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
	var mapOptions = {
		center: new google.maps.LatLng(37.784173, -122.401557),
		zoom: 15
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

