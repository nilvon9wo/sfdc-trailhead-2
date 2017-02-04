({
    handleExpenseInit: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            component.set('v.expenses', response.getReturnValue());
        }
        else {
            console.error('Failed with state: ' + state);
        }
	},
    
	createExpense : function(component, expense) {
        this.saveExpense(component, expense, function(response) {
            return this.handleSaveResult(component, response);
        });
	},
    
    updateExpense: function(component, expense) {
        this.saveExpense(component, expense);
    },
    
    saveExpense: function(component, expense, callback) {
        var action = component.get('c.saveExpense');
        action.setParams({'expense': expense});
        if (callback) {
        	action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    
    handleSaveResult: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            var expenses = component.get('v.expenses');
            expenses.push(response.getReturnValue());
            component.set('v.expenses', expenses);
        }
    }
})