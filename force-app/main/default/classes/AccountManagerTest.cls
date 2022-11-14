@isTest
public class AccountManagerTest{
    static testmethod void test(){
        account a = new account();
        a.Name = 'test account';
        insert a;
        
        Contact c1 = new Contact();
        c1.AccountId = a.Id;
        c1.LastName = 'lName';
        insert c1;
        
        Contact c2 = new Contact();
        c2.AccountId = a.Id;
        c2.LastName = 'lName';
        insert c2;
        
        RestRequest request = new RestRequest();
        request.requesturi = 'https://na1.salesforce.com/services/apexrest/account/'+a.Id+'/contacts';
        RestContext.request = request;
        
        Account acc = AccountManager.getAccount();
    }
}