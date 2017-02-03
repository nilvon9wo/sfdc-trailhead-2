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
        var action = component.get('c.saveExpense');
        action.setParams({'expense': expense});
        action.setCallback(this, function(response) {
           this.handleSaveResult(component, response);
        });
        $A.enqueueAction(action);
	},
    
    handleSaveResult: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            var expenses = component.get('v.expenses');
            expenses.push(response.getReturnValue());
            component.set('v.expenses', expenses);
        }
    },
    
    validate : function(component, fieldName, errorMessage, rule) {
        var field = component.find(fieldName);
        var value = field.get('v.value');
        if (!rule(value)){
            field.set('v.errors', [{message: errorMessage}]);
            return false;
        }
        else {
            field.set('v.errors', []);
        }
        return true;
	},
    
    hasValue : function(value) {
        return !($A.util.isEmpty(value));
    },
    
    hasValueGreaterThanZero : function(value) {
        return !($A.util.isEmpty(value) || isNaN(value) || (value <= 0.0));
    },

    isNotBlank: function(component, label, fieldName) {
        return this.validate(component, fieldName, label + ' can\'t be blank.', this.hasValue);
    },

    isGreaterThanZero: function(component, label, fieldName) {
        return this.validate(component, fieldName, label + ' must be numeric and greater than zero.', this.hasValueGreaterThanZero);
    },
    
    validateExpenseForm: function(component) {
        return this.isNotBlank(component, 'Expense name', 'expname')
        	&& this.isGreaterThanZero(component, 'Amount', 'amount');
    },
    
    resetExpenseForm: function(component) {
			var blankItem = {
                sobjectType: 'Expense__c',
                Name: '',
                Amount__c: 0,
                Client__c: '',
                Date__c: '',
                Reimbursed__c: false
            };                                   
            component.set('v.newExpense', JSON.parse(JSON.stringify(blankItem)));	
    }
    
})