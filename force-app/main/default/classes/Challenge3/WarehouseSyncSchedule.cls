global with sharing class WarehouseSyncSchedule implements Schedulable{
    public WarehouseSyncSchedule() {

    }

    global void execute(SchedulableContext context){
        WarehouseCalloutService.runWarehouseEquipmentSync();
        String var = '00 00 01 * * ?';
        System.schedule('WarehouseSyncScheduleJob', var, new WarehouseSyncSchedule());
    }

}
