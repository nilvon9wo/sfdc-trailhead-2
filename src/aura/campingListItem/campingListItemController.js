({
	packItem : function(component, event) {
        var item = component.get('v.item', true);
        item.Packed__c = true;
		component.set('v.item', item);
        
        var buttonClicked = event.getSource();
        buttonClicked.set('v.disabled', true);
	}
})