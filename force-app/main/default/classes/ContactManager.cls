public with sharing class ContactManager {
    @Auraenabled(cacheable=true)
    public static list<contact> fetchAllContacts(Id accountId) {
        if(AccountId != null){
            List<contact> conLst = [Select Id,NAME,Phone,Email,Account.Id from Contact where AccountID =: accountId];
            return conLst;
        }
        else{
            return null;
        }
        
    }
    @Auraenabled(cacheable=true)
    public static List<Account> getAllAccounts(){
        List<Account> accLst = [Select Id,Name from Account];
        return accLst;
    }

    @Auraenabled(cacheable=true)
    public static List<Contact> getAllContacts(){
        List<contact> conLst = [Select Id,Email,Phone,AccountId from Contact limit 10];
        system.debug('conLst--'+conLst);
        return conLst;
    }
}