({
    pack : function(component, event, helper) {
        var pa = component.get("v.item");
        pa.Packed__c = true;
        component.set("v.item", pa);
    }
})
