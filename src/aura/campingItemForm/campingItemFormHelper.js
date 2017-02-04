({
    createItem: function(component, newItem) {
        var action = component.get('c.saveItem');
        action.setParams({'campingItem': newItem});
        action.setCallback(this, function(response) {
           this.handleSaveResult(component, response);
        });
        $A.enqueueAction(action);
        
    },
    
    handleSaveResult: function(component, response) {
    	var state = response.getState();
        if (component.isValid() && state === 'SUCCESS') {
            var items = component.get('v.items');
            items.push(response.getReturnValue());
            component.set('v.items', items);
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
    
    isNotBlank: function(component, label, fieldName) {
        return this.validate(component, fieldName, label + ' can\'t be blank.', this.hasValue);
    },
    
    resetForm: function(component) {
			var blankItem = {
                sobjectType: 'Camping_Item__c', 
                Name: '',
                Quantity__c: 0, 
                Price__c: 0,
                Packed__c: false
            };                                   
            component.set('v.newItem', JSON.parse(JSON.stringify(blankItem)));	
    }
})