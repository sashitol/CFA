({

//test 2
    //code chjanged from someoneelse
    //on more outsider
    //from inside  to check folder
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a) {
            component.set("v.accounts", a.getReturnValue());
            var event = $A.get("e.c:AccountsLoaded");
            event.setParams({"accounts": a.getReturnValue()});
            event.fire();
            //test
        });
    $A.enqueueAction(action);
    }
})