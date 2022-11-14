@istest
public class DailyLeadProcessorTest{
    @testsetup
    static void setUp(){
        List<Lead> leadLst = new List<Lead>();
        for(integer i = 0; i<200; i++){
            Lead l = new Lead();
            l.LastName = 'LastName'+i;
            l.Company = 'Company'+i;
            l.status = 'Open';
            leadLst.add(l);
        }
        insert leadLst;
    }
    
    @istest
    static void DailyLeadProcessorTest(){
        List<Lead> leadLst = new List<Lead>([Select Id,LeadSource from Lead where LeadSource =: Null]);
        DailyLeadProcessor sch = new DailyLeadProcessor();
        system.schedule('Test','0 0 0 15 3 ? 2022',sch);
    }
}