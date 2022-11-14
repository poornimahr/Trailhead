@isTest
public class AddPrimaryContactTest{

    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState='NY'
            ));
        }
        for (Integer i = 50; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i,BillingState='CA'
            ));
        }
        insert accounts;
        
        Contact c = new Contact();
        c.LastName = 'LastName';
        c.AccountId = accounts[0].Id;
        insert c;
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        List<Contact> conLst = new List<Contact>([Select Id,LastName from Contact limit 1]);
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(conLst[0], 'NY');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest(); 
    }
    
}