({
    handleCampingItemsInit: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            component.set('v.items', response.getReturnValue());
        }
        else {
            console.error('Failed with state: ' + state);
        }
	},
    
    handleSaveResult: function(component, item, response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {        
            var items = component.get('v.items');
            items.push(item);
            component.set('v.items',items);
        }
    },
    
	createItem : function(component, item) {
        this.saveItem(component, item, function(response) {
            return this.handleSaveResult(component, item, response);
        });
	},
    
    saveItem: function(component, item, callback) {
        var action = component.get('c.saveItem');
		action.setParams({'campingItem': item});
        if (callback) {
        	action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    
})