public class AddPrimaryContact implements Queueable{
    private string accountstate;
    private Contact c; 
       
    public AddPrimaryContact(Contact c,String AccountState){
        this.accountState = AccountState;
        this.c = c;
    }
        
    public void execute(QueueableContext context) {
    List<Contact> conLst = new List<Contact>();
        List<Account> accLst = new List<Account>([Select Id,BillingState from account where BillingState =:AccountState limit 200]);
        for(Account a : accLst){
            Contact con = c.Clone();
            con.AccountId = a.Id;
            conLst.add(con);
        }
        insert conLst;
    }
}