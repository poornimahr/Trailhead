trigger AccountAddressTrigger on Account (before insert,BEFORE UPDATE) {
    for(Account a : trigger.New){
        if(a.Match_Billing_Address__c == true && a.BillingPostalCode != null){
            a.ShippingPostalCode = a.BillingPostalCode;    
        }
    } 
}