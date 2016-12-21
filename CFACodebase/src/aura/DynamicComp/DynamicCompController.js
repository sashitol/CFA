({
        doInit : function(cmp) {
        $A.createComponent(
            "ui:button",
            {
            "aura:id": "findableAuraId",
            "label": "Press Me",
            "press": cmp.getReference("c.handlePress")
            },
        function(newButton, status, errorMessage){
            //Add the new button to the body array
            if (status === "SUCCESS") {
            var body = cmp.get("v.body");
            body.push(newButton);
            cmp.set("v.body", body);
            }
            else if (status === "INCOMPLETE") {
            console.log("No response from server or client is offline.")
            // Show offline error
            }
            else if (status === "ERROR") {
            console.log("Error: " + errorMessage);
            // Show error message
            }
        }
        );
    },
    handlePress : function(cmp) {
    console.log("button pressed");
        
   }
})