({
	add : function(component, event, helper) {
		var sum = component.get("v.num1") + component.get("v.num2");
			component.set("v.sum", sum);
	}
})