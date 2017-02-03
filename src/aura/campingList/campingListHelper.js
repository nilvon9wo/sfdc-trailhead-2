({
    handleCampingItemsInit: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            component.set('v.items', response.getReturnValue());
        }
        else {
            console.error('Failed with state: ' + state);
        }
	}
})