({
    doInit: function(component, event, helper) {
    	var action = component.get('c.getExpenses');
        action.setCallback(this, function(response) {
        	helper.handleExpenseInit(component, response);
        });
        $A.enqueueAction(action);
    },

    handleCreateExpense : function(component, event, helper) {
        var newExpense = event.getParam('expense');
        helper.createExpense(component, newExpense);
    },
    
    handleUpdateExpense : function(component, event, helper) {
        var updatedExpense = event.getParam('expense');
        helper.updateExpense(component, updatedExpense);
    }
})