public class AccountProcessor{
    @future
    public static void countContacts(List<Id> accIdLst){
        List<Account> updateAccLst = new List<Account>();
        List<Account> accLst = new List<Account>([Select Id,(Select Id from Contacts),Number_of_contacts__c from Account where Id IN: accIdLst]);
        if(accLst != null && !accLst.IsEmpty()){
            for(Account a : accLst){
                a.Number_of_contacts__c = a.contacts.size();  
                account acc = new account(Id=a.Id,Number_of_contacts__c=a.Number_of_contacts__c);
                updateAccLst.add(a);  
            }
            update updateAccLst;
        }
    }
}