global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext context){
        List<Lead> leadLst = new List<Lead>([Select Id,LeadSource from Lead where LEadSource =: null limit 200]);
        for(Lead l : leadLst){
            l.LeadSource = 'Dreamforce';
        }
        update leadLst;
    }
}