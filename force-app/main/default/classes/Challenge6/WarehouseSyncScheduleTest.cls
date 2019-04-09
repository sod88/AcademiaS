@isTest
private class WarehouseSyncScheduleTest {
    @isTest
    public static void testSchedule(){
        
        Test.startTest();

        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());

        String CRON_EXP = '00 00 01 * * ?';
        String jobId = System.schedule('Test Time', CRON_EXP, new WarehouseSyncSchedule());

        CronTrigger ct = [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals('2019-04-10 01:00:00', String.valueOf(ct.NextFireTime));

        Test.stopTest();
    }
}