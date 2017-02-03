({
    doInit: function(component, event, helper) {
    	var action = component.get('c.getExpenses');
        action.setCallback(this, function(response) {
        	helper.handleExpenseInit(component, response);
        });
        $A.enqueueAction(action);
    },
    
	clickCreateExpense : function(component, event, helper) {
        if(helper.validateExpenseForm(component)) {
            var newExpense = component.get('v.newExpense');
            helper.createExpense(component, newExpense);
            helper.resetExpenseForm(component);
        }
	}
})