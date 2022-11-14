trigger MaintenanceRequest on Case (before update, after update) {
     if(trigger.IsUpdate && trigger.IsAfter){
         MaintenanceRequestHelper.updateWorkOrders(trigger.new,trigger.oldMap); 
     } 
}