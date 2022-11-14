public with sharing class NewCaseListController {
    public list<Case> getNewCases(){
        List<case> caseLst = new List<case>([Select Id,CaseNumber from Case where status ='New']);
        return caseLst;
    }
}