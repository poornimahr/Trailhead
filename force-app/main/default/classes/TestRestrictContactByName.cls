@istest
public class TestRestrictContactByName {
    static testMethod void method1(){
        Account a = new account();
        a.Name = 'test';
        insert a;
        
        system.debug('account--'+a.Id);
        Contact c = new contact();
        c.LastName = 'INVALIDNAME';
        c.AccountId = a.Id;
        try{
            INSERT c;
        }
        catch(exception e){
            
        }
    }
}