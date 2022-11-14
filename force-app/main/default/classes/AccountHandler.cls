public class AccountHandler{
    public static account insertNewAccount(String name){
        Account a = new account(Name = name);
        try{
            insert a;
            return a;
        }
        catch(Exception e){
            return null;
        }
    }
}