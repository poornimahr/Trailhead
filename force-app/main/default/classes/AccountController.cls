public with sharing class AccountController {
    //test WF action
    //CICD - patch 5
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, 
            AnnualRevenue, 
            Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}
