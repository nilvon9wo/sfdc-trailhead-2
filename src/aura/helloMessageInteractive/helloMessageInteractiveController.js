({
	handleClick : function(component, event) {
		var buttonClicked = event.getSource();
        var buttonMessage = buttonClicked.get('v.label');
        component.set('v.message', buttonMessage);
	},
	handleClick2 : function(component, event) {
        var newMessage = event.getSource().get('v.label');
        component.set('v.message', newMessage);
	},
	handleClick3 : function(component, event) {
        component.set('v.message', event.getSource().get('v.label'));
	}
})