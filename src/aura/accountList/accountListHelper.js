({
	getAccountList : function(component) {
		var action = component.get('c.findAll');
        var self = this;
        
        action.setCallback(this, function(actionResult) {
            var accounts = actionResult.getReturnValue();
            component.set('v.accounts', accounts);
            var event = $A.get('e.c:accountsLoaded');
            event.setParams({accounts: accounts});
            event.fire();
        });
        
        $A.enqueueAction(action);
	}
})