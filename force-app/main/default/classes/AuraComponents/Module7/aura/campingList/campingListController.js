({
    doInit : function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();

            if(component.isValid() && state === "SUCCESS"){
                component.set("v.items", reponse.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    NewCamping : function(component, event, helper){
        helper.validateInputs(component, component.find("Name"));
        helper.validateInputs(component, component.find("Price"));
        helper.validateInputs(component, component.find("Quantity"));
        if(component.get("v.validation") === false){
            helper.createItem(component, Item);
        }
    }
})
