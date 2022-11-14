public class fetchContactsClass {
	@auraenabled
    public static List<contact> getContact(Id accId){
        List<contact> conList = [select Id, Firstname,lastname,email from contact where accountId =: accId limit 1];
        return conList;
    }
}