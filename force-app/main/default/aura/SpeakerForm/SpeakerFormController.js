({
    onSuccess : function(component, event, helper) {
        var resultToast = $A.get("e.force:showToast");
        resultToast.setParams({
            "title" : "Success!",
            "massage" : "Record Saved Successfully"
        });
        resultToast.fire();

        //Navigate to sObject home page
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope" : "Speaker__c"
        })
        homeEvent.fire();
    }
})
