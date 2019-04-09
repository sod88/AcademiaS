global with sharing class WarehouseSyncSchedule implements Schedulable{

    global void execute(SchedulableContext context){
        WarehouseCalloutService.runWarehouseEquipmentSync();
        String var = '00 00 01 * * ?';
        System.schedule('WarehouseSyncScheduleJob', var, new WarehouseSyncSchedule());
    }

}
