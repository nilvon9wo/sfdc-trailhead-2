({
	clickCreateExpense : function(component, event, helper) {
        if(helper.validateExpenseForm(component)) {
            var newExpense = component.get('v.newExpense');
            helper.createExpense(component, newExpense);
            helper.resetExpenseForm(component);
        }
	}
})