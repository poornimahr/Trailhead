@istest
public class LeadProcessorTest{
    static testmethod void LeadProcessorTest(){
        List<Lead> leadLst = new list<Lead>();
                
        test.startTest();
        for(integer i=0;i<200;i++){
            lead l = new lead();
            l.LastName = 'lastName'+i;
            l.Company = 'company'+i;
            l.LeadSource = 'open';
            leadLst.add(l);
        }
        insert leadLst;

            LeadProcessor lp = new LeadProcessor();
            database.executebatch(lp);
        test.stopTest();
        
    }
}