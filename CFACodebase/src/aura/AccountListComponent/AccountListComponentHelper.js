({
        getAccounts : function(component) {
        var action = component.get('c.getAccountsA');
	    $A.enqueueAction(action);
 		   
        var self = this;
        action.setCallback(this, function(actionResult) {
        component.set('v.accounts', actionResult.getReturnValue());
    });
	}
})