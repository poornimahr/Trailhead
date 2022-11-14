trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    set<Id> oppIdSet = new set<Id>();
    list<task> taskLst = new list<task>();
    for(Opportunity o: trigger.New){
        if(trigger.IsInsert){
            if(o.StageName == 'Closed Won'){
            	oppIdSet.add(o.Id);    
            }
        }
        if(trigger.Isupdate){
        	if(o.StageName != trigger.oldMap.get(o.Id).stageName && o.StageName == 'Closed Won'){
            	oppIdSet.add(o.Id);    
            }    
        }
    }
    
    if(oppIdSet != null && !oppIdSet.IsEmpty()){
        for(Id i : oppIdSet){
         	task t = new task();
            t.whatId = i;
            t.subject = 'Follow Up Test Task';
            taskLst.add(t);
        }    
    }
    
    if(taskLst != null && !taskLst.IsEmpty()){
    	insert taskLst;
    }
}