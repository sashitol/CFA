({
getAllOpertunities: function(cmp){
    var action = cmp.get("c.getOpportunities");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
            cmp.set("v.oppertunitiesList", response.getReturnValue());
            }
        });
    $A.enqueueAction(action);
},
 
    getOpportunity: function(cmp){
    var action = cmp.get("c.getOpportunity");
        action.setParams({Id :cmp.get("v.id")});        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
            cmp.set("v.oppertunity", response.getReturnValue());
            }
        });
    $A.enqueueAction(action);
}
    
})