@RestResource(urlMapping='/Accounts/*/Contacts')
    global with Sharing class AccountManager{
        @httpGet
        global static Account getAccount(){
        
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
         List<String> lst = request.requestURI.split('/');                
        String accountID = lst[lst.size() - 2];
        Account obj = [select Id,Name ,(select Id,Name from Contacts) from Account where Id=:accountID limit 1];
        return obj ;
        }
    }