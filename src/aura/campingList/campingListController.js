({
    doInit: function(component, event, helper) {
    	var action = component.get('c.getItems');
        action.setCallback(this, function(response) {
        	helper.handleCampingItemsInit(component, response);
        });
        $A.enqueueAction(action);
    }
})