public with sharing class WarehouseCalloutService {
    
    private static final String URL = 'https://th-superbadge-apex.herokuapp.com/equipment';

    @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(URL);
        request.setMethod('GET');
        HttpResponse response = Http.send(request);

        if(response.getStatusCode() == 200){
            List<Product2> listaFinal = getEquipment(response);
            if(listaFinal.size() > 0){
                insert listaFinal;
            }
        }
    }

    public static List<Product2> getEquipment(HttpResponse rep){
        Map<String, Object> objList = (Map<String, Object>) JSON.deserializeUntyped(rep.getBody());
        List<Product2> auxList = new List<Product2>();
        List<Map<String, Object>> data = new List<Map<String, Object>>();
        for(Object it : (List<Object>)objList.get('equipment')){
            Map<String, Object> m = (Map<String, Object>)it;
            Product2 newEquipment = new Product2();

            newEquipment.Replacement_Part__c = (Boolean)m.get('replacement');
            newEquipment.Current_Inventory__c = (Integer)m.get('quantity');
            newEquipment.Name = (String)m.get('name');
            newEquipment.Maintenance_Cycle__c = (Integer)m.get('maintenanceperiod');
            newEquipment.Lifespan_Months__c = (Integer)m.get('lifespan');
            newEquipment.Cost__c = (Integer)m.get('cost');
            newEquipment.Warehouse_SKU__c = (String)m.get('sku');
            auxList.add(newEquipment);
        }
        return auxList;
    }
}
