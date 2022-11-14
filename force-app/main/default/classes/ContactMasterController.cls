public class ContactMasterController {
    @auraenabled
    public List<contact> getContacts(){
        List<contact> conLst = [select Id,FirstName,LastName,Email from Contact];
        return conLst;
    }
}