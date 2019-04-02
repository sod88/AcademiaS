({
    validateInputs : function(component, field) {
        var name = field.get("v.value");
        if($A.util.isEmpty(name)){
            component.set("v.validation", true);
        }
    },

    createItem : function(component, Item){
        var action = component.get("c.saveItem");
        action.setParams({"CampingItem":Item});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS"){
                console.log('Save Done');
            }
        });
        $A.enqueueAction(action);

        var Items = component.get("v.items");
        var item = component.get("v.newItem");
        Items.push(item);
        component.set("v.items", Items);
    }
})
