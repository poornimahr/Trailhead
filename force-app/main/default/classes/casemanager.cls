@restResource(urlMapping='/Case/*')
global with sharing class casemanager{
    @httpGet
    global static Case getCaseById(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result =  [SELECT OwnerId,CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        WHERE Id = :caseId];
        return result;
          
    }
    @httpPost
    global static Id createcase(String status, String subject, String origin,String priority){
        Case caseNew = new case(Status = status,Subject = subject,Origin = origin,Priority = priority);
        insert caseNew;
        return caseNew.Id;
    }
    
    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        delete thisCase;
    }  
    
    @HttpPut
    global static String upsertCase(String subject, String status,
        String origin, String priority, String id) {
        Case thisCase = new Case(
                Id=id,
                Subject=subject,
                Status=status,
                Origin=origin,
                Priority=priority);
        // Match case by Id, if present.
        // Otherwise, create new case.
        upsert thisCase;
        // Return the case ID.
        return 'Success';
    }
}