public class ContactSearch{
    public static List<Contact> searchForContacts(String lastName, String MailingPostalCode){
        List<Contact> conLst = new List<contact>();
        conLst = [select Id, Name from Contact where (LastName =: lastName AND
                  MailingPostalCode =: MailingPostalCode)];
        return conLst;
    }
}