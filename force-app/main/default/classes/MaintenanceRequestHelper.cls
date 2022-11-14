public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> updatedCaseLst,Map<Id,case> oldCaseMap){
        List<Case> caseLst = new List<Case>();
        for(Case c : updatedCaseLst){
            if(c.status == 'Closed' && oldCaseMap.get(c.Id).status != c.Status && c.Type == 'Routine Maintenance'){
                Case clonedCase = c.Clone();
                clonedCase.Subject = 'Routine Maintenance';  
                clonedCase.Type = 'Routine Maintenance'; 
                clonedCase.Date_Reported__c = system.today();
                clonedCase.status = 'New';
                caseLst.add(clonedCase);
            }
        }
        insert caseLst;
    }        
    
}