({
	clickReimbursed : function(component, event, helper) {
		var expense = component.get('v.expense');
        var updateEvent = component.get('v.updateExpense');
        updateEvent.setParams({expense: expense});
        updateEvent.fire();
	}
})