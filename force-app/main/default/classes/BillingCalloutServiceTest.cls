@isTest
private class BillingCalloutServiceTest {
    
    private static string STATUS_BILLABLE = 'Billable';
    private static string STATUS_BILLED = 'Billed';

    @testSetup
    private static void setupData(){


        ServiceCredentials__c servicecredentials = new ServiceCredentials__c();
        servicecredentials.Name = 'BillingServiceCredential';    //Name
        servicecredentials.Password__c = 'Wp4RKGh'  ;    //Password
        servicecredentials.Username__c = 'JRJgv5S'  ;    //Username
        
        insert servicecredentials;
        
        

        List<Opportunity> opportunityList = new List<Opportunity>();
        for(Integer i=0; i<5; i++){
            Opportunity opportunity = new Opportunity();
            opportunity.Name = 'ln5NZkC' + string.valueof(i) ;    //Name
            opportunity.StageName = 'Value Proposition';    //Stage
            opportunity.CloseDate = Date.today();    //Close Date
            opportunityList.add(opportunity);
        }
        insert opportunityList;
        
        List<Project__c> projectList = new List<Project__c>();
        for(Integer i=0; i<5; i++){
            Project__c project = new Project__c();
            project.Opportunity__c = opportunityList[i].Id;
            project.Name = 'ok2wb8K' + string.valueof(i) ;    //Project Name
            project.Billable_Amount__c = 500 ;    //Billable Amount
            project.End_Date__c = Date.today();    //End Date
            project.ProjectRef__c = 'gI0LmAP' + string.valueof(i) ;    //ProjectRef
            project.Start_Date__c = Date.today();    //Start Date
            project.Status__c = 'Running';    //Status
            projectList.add(project);
        }

        insert projectList;
        
        
    }

    @isTest
    private static void testSuccess(){
        List<Project__c> projects = [
        SELECT
        ID,
        Status__c,
        ProjectRef__c
        from 
        Project__c
        where 
        Name = 'ok2wb8K0'
        ];

        System.assertEquals(1, projects.size());

        projects[0].Status__c = STATUS_BILLABLE;

        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMock());

        Test.startTest();

        update projects;

        Test.stopTest();

        projects = [
        SELECT
        ID,
        Status__c
        from 
        Project__c
        where 
        Name = 'ok2wb8K0'
        ];

        System.assertEquals(1, projects.size());

        System.assertEquals(STATUS_BILLED, projects[0].Status__c);
    }


    @isTest
    private static void testFailure(){
        List<Project__c> projects = [
        SELECT
        ID,
        Status__c
        from 
        Project__c
        where 
        Name = 'ok2wb8K1'
        ];

        System.assertEquals(1, projects.size());

        projects[0].Status__c = STATUS_BILLABLE;

        Test.setMock(WebServiceMock.class, new BillingCalloutServiceMockFailure());

        Test.startTest();

        update projects;

        Test.stopTest();

        projects = [
        SELECT
        ID,
        Status__c
        from 
        Project__c
        where 
        Name = 'ok2wb8K1'
        ];

        System.assertEquals(1, projects.size());

        System.assertEquals(STATUS_BILLABLE, projects[0].Status__c);
    }

}