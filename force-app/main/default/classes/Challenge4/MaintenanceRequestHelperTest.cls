
@isTest
public class MaintenanceRequestHelperTest {
    
    @isTest
    public static  void runTest(){
        List<Case> normal = new List<Case>();

        Vehicle__c veh = new Vehicle__c(Name = 'Truck', Model__c = 'Z564');
        insert veh;

        Product2 pr = new Product2(Name = 'Equipment1', Replacement_Part__c = false, Current_Inventory__c = 10, Maintenance_Cycle__c = 15, Lifespan_Months__c = 100,
        Cost__c = 500, Warehouse_SKU__c = '1000');
        insert pr;

        for(Integer i = 0; i < 300; i++){
            Case cm = new Case(Type = 'Routine' + i, Description = 'New Rountine Maintenance' + i, Status = 'New', Vehicle__c = veh.id, Equipment__c = pr.id);
            normal.add(cm);
        }
        insert normal;


        List<Case> finalList = new List<Case>();
        for(Case it : normal){
            it.Status = 'Closed';
            it.Date_Reported__c = Date.today().addDays(Integer.valueOf(pr.Maintenance_Cycle__c));
            it.Type = 'Routine Maintenance';
            finalList.add(it);
        }
        
        Test.startTest();

            List<Database.SaveResult> results = Database.update(finalList);

        Test.stopTest();

        for(Database.SaveResult it :  results){
            System.assert(it.isSuccess());
        }
    }
}
