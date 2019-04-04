({
    doInit : function(component, event, helper) {
        var action = component.get("c.getItems");

        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS"){
                component.set("v.items", response.getReturnedValue());
            }else{
                console.log("Failed");
            }
        });
        $A.enqueueAction(action);
    },

    handleAddItem : function(component, event, helper){
        var action = component.get("c.saveItem");
        action.setParams({"item" : newItem});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS"){
                var it = component.get("v.items");
                it.push(response.getReturnedValue());
                component.set("v.items", it)
            }
        });
        $A.enqueueAction(action);
    }
})
