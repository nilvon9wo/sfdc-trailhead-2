({
    doInit: function(component, event, helper) {
    	var action = component.get('c.getItems');
        action.setCallback(this, function(response) {
        	helper.handleCampingItemsInit(component, response);
        });
        $A.enqueueAction(action);
    },

    handleAddItem: function(component, event, helper) {
        var newItem = event.getParam('item');
        helper.createItem(component, newItem);
    }
})