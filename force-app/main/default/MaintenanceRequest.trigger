trigger MaintenanceRequest on Case (before update, after update) {
    MaintenanceRequestHelper.updateRequests();
}