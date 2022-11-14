public with sharing class RandomContactFactory{
    public static List<Contact> generateRandomContacts(Integer i, string s){
        List<Contact> conLst = new List<Contact>();        
        for(integer count = 0;count <i;count++){
            contact c = new contact();
            c.firstName = 'test' + count;
            c.LastName = s;
            conLst.add(c);
        }
        return conLst;
    }
}