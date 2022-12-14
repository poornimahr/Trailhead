global class LeadProcessor implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select Id,LeadSource from Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead l : scope){
            l.LeadSource = 'Dreamforce';
        }
        update scope;
    }    

    global void finish(Database.BatchableContext bc){
    }    

}