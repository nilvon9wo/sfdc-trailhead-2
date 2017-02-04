({
	doInit : function(component, event, helper) {
		helper.getAccountList(component);
	},
	deleteAccount: function(component, event, helper) {
        console.log('######## deleteAccount');
	    event.preventDefault();
	    var accountName = event.target.getElementsByClassName('account-name')[0].value;
        console.log('######## deleteAccount ', accountName);
	    confirm('Delete the ' + accountName + ' account? (Don\’t worry, this won\’t actually work!)');
	}
})