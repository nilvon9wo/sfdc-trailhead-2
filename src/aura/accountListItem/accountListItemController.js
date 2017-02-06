({
    accountSelected: function(component) {
        var event = $A.get('e.c:accountSelected');
        event.setParams({account: component.get('v.account')});
        event.fire();
    },
	deleteAccount: function(component, event) {
	    event.preventDefault();
	    var accountName = event.target.getElementsByClassName('account-name')[0].value;
	    confirm('Delete the ' + accountName + ' account? (Don\’t worry, this won\’t actually work!)');
	}
})