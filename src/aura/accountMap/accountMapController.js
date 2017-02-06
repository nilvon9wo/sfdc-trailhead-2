({
	afterLeafletLoaded : function(component, event, helper) {
        setTimeout(function(){
            var sanFranciscoCoordinates = [37.784173, -122.401557];
            var map = L.map('map', {zoomControl: false})
            	.setView(sanFranciscoCoordinates, 14);
            
			var argisUrl = 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}';
            L.tileLayer(argisUrl, {attribution: 'Tiles © Esri'})
            	.addTo(map);
            component.set('v.map', map);
        });
	},
    accountsLoaded : function(component, event, helper) {
        var map = component.get('v.map');
        var accounts = event.getParam('accounts');
        accounts.forEach(function(account){
            var latLng = [account.Location__Latitude__s, account.Location__Longitude__s];
            L.marker(latLng, {account: account}).addTo(map).on('click', function(event) {
    			helper.navigateToDetailsView(event.target.options.account.Id);
			});
        });
    },
    accountSelected: function(component, event, helper){
        var map = component.get('v.map');
        var account = event.getParam('account');
        map.panTo([account.Location__Latitude__s, account.Location__Longitude__s]);
    }
})