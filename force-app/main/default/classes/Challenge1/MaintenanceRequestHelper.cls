public with sharing class MaintenanceRequestHelper {

    public static void updateRequests(){
        List<Case> requests = [SELECT Id, Vehicle__c, Equipment__c, Type, Status, Equipment__r.Maintenance_Cycle__c FROM Case WHERE ID IN :Trigger.New LIMIT 300];

        if(requests.size() > 0 ){
            List<Case> finalList = getMaintenanceRequests(requests);
            insert finalList;
        }
    }

    public static List<Case> getMaintenanceRequests(List<Case> reqList){
        List<Case> auxList = new List<Case>();
        for(Case it : reqList){
            if(it.Type == 'Routine Maintenance' && it.Status == 'Closed'){
                Case newRequest = new Case();
                newRequest.Type = 'Routine Maintenance';
                newRequest.Status = 'New';
                newRequest.Description = 'New Rountine Maintenance';
                newRequest.Vehicle__c = it.Vehicle__c;
                newRequest.Equipment__c = it.Equipment__c;
                newRequest.Date_Reported__c = Date.today().addDays(Integer.valueOf(it.Equipment__r.Maintenance_Cycle__c));
                auxList.add(newRequest);
            }
        }
        return auxList;
    }
}
