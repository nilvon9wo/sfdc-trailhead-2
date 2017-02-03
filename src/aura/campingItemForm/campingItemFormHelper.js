({
    createItem: function(component, item) {
        var items = component.get("v.items");
        var newItem = JSON.parse(JSON.stringify(item));
        items.push(newItem);
        component.set("v.items", items);
    },
	
    validate : function(component, fieldName, errorMessage, rule) {
        var field = component.find(fieldName);
        var value = field.get('v.value');
        if (!rule(value)){
            field.set('v.errors', [{message: errorMessage}]);
            return false;
        }
        return true;
	},
    hasValue : function(value) {
        return !($A.util.isEmpty(value));
    },
    isNotBlank: function(component, label, fieldName) {
        return this.validate(component, fieldName, label + ' can\'t be blank.', this.hasValue);
    }
})