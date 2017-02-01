({
	myAction : function(component, event, helper) {
        var expname = component.find('expname').get('v.value');
        var nameFieldErrors = ($A.util.isEmpty(expname)) ? [{message: 'Expense name can\'t be blank.'}] : null;
        nameField.set('v.errors', nameFieldErrors);
        
        if(!nameFieldErrors) {
            var newExpense = component.get('v.newExpense');
            console.info('Create expense: ' + JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
	}
})