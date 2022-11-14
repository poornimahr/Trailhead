@istest
public class AccountProcessorTest{
    static testmethod void AccountProcessorTest(){
        test.starttest();
        account a = new account();
        a.name = '1';
        insert a;
        
        Contact c = new Contact();
        c.LastName = 'LName';
        c.AccountId = a.Id;
        insert c;
        
        List<Id> idLst = new List<Id>();
        idLst.add(a.Id);
        
        AccountProcessor.countContacts(idLst);
        
        test.stopTest();
    }
}