({
init : function(cmp){
 	
        var action = cmp.get('c.getCurrentValue');
	   var self = this;
    	var apiname=cmp.get('v.lookupAPIName');
        action.setParams({
            'value' : cmp.get('v.lookupAPIName'),
        });
        action.setCallback(this, function(a) {
            var result = a.getReturnValue();
                cmp.set("v.searchString", result);
        });
        $A.enqueueAction(action);
    }
})