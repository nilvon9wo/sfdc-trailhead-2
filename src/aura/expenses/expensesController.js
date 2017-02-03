({
    doInit: function(component, event, helper) {
    	var action = component.get('c.getExpenses');
        action.setCallback(this, function(response) {
        	helper.receiveResponse(component, response);
        });
        $A.enqueueAction(action);
    },
    
	clickCreateExpense : function(component, event, helper) {
        var validExpense = true;
        
        var nameField = component.find('expname');
        var expname = nameField.get('v.value');
        var nameFieldErrors = ($A.util.isEmpty(expname)) ? [{message: 'Expense name can\'t be blank.'}] : null;
        nameField.set('v.errors', nameFieldErrors);
        
        if(!nameFieldErrors) {
            var newExpense = component.get('v.newExpense');
            console.info('Create expense: ' + JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
	}
})