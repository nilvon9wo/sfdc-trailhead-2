({
    submitForm: function(component, event, helper) {
        var isValid = helper.isNotBlank(component, 'Item name', 'itemName')
        	&& helper.isNotBlank(component, 'Quantity', 'quantity')
        	&& helper.isNotBlank(component, 'Price', 'price');
        
        if (isValid) {
        	var newItem = component.get('v.newItem');
            helper.createItem(component, newItem);
            helper.resetForm(component);
        }
    }
})