({
	clickReimbursed : function(component, event, helper) {
		var expense = component.get('v.expense');
        var updateEvent = component.getEvent('updateEvent');
        updateEvent.setParams({expense: expense});
        updateEvent.fire();
	}
})