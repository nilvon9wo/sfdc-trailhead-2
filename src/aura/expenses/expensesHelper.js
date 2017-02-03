({
    receiveResponse: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            component.set('v.expenses', response.getReturnValue());
        }
        else {
            console.error('Failed with state: ' + state);
        }
	},
	createExpense : function(component, expense) {
		var theExpenses = component.get("v.expenses");
        
        // Copy the expense to a new object; THIS IS TEMPORARY HACK
        var newExpense = JSON.parse(JSON.stringify(expense));

		theExpenses.push(newExpense);
        component.set('v.expenses', theExpenses);
	}
})