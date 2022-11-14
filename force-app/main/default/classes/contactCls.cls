public with sharing class contactCls {
    @AuraEnabled(cacheable=true)
    public static list<Contact> queryContacts() {
        List<Contact> conLst = new List<Contact>();
        conLst = [Select Id,Email,Phone,Name from Contact limit 15];
        return conLst;

    }

    @AuraEnabled(cacheable=true)
    public static list<Account> getAllAccount() {
        List<Account> accLst = new List<Account>();
        accLst = [Select Id,Name from Account];
        return accLst;

    }

    @AuraEnabled(cacheable=true)
    public static list<Contact> displayContactsForSelectedAccount(Id AccountId) {
        List<Contact> conLst = new List<Contact>();
        conLst = [Select Id,Email,Phone,Name from Contact where AccountId=:AccountId];
        return conLst;

    }
}