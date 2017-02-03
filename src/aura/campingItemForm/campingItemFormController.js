({
    clickCreateItem: function(component, event, helper) {
        var isValid = helper.isNotBlank(component, 'Item name', 'itemName')
        	&& helper.isNotBlank(component, 'Quantity', 'quantity')
        	&& helper.isNotBlank(component, 'Price', 'price');
        
        if (isValid) {
            var newItem = component.get("v.newItem");
            console.info("Create item: " + JSON.stringify(newItem));

            //helper.createItem(component, newItem);
        	var newItem = JSON.parse(JSON.stringify(newItem));
            
            var items = component.get("v.items");
        	items.push(newItem);
        	component.set("v.items", items);
            
            var blankItem = {
                sobjectType: 'Camping_Item__c', 
                Name: '',
                Quantity__c: 0, 
                Price__c: 0,
                Packed__c: false
            };                                   }
            component.set("v.newItem", JSON.parse(JSON.stringify(blankItem)));
        }
    }
})