var map;

google.maps.event.addDomListener(window, 'load', initialize);

function initialize() {
	var mapOptions = {
		center: new google.maps.LatLng(37.784173, -122.401557),
		zoom: 15
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	loadHotels();
}

function loadHotels() {
	Visualforce.remoting.Manager.invokeAction(
		'{!RemoteAction.HotelRemoter.findAll}',
		hotelHandler,
		{secape: true}
	);

	function hotelHandler(hotelList, event) {
		if (event.status) {
			for (var i = 0; i < hotelList.length; i++) {
				addMarker(hotelList[i]);
			}
		}
		else {
			alert(event.message);
		}
	}

	function addMarker(hotel) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(hotel.Location__Latitude__s, hotel.Location__Longitude__s),
			map: map,
			title: hotel.Name
		});
		google.maps.event.addListener(marker, 'click', setLocation);
		
		function setLocation() {
			window.top.location = '/' + hotel.Id;
		}
	}
}


