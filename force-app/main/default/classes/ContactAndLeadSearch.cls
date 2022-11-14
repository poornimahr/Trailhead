public class ContactAndLeadSearch{
    public static List<List< SObject>> searchContactsAndLeads(String searchVar){
        List<List< SObject>> returnLst = [FIND :searchVar in ALL fields returning Contact(FirstName,LastName),Lead(firstName,LastName)];
        return returnLst ;
    }
}