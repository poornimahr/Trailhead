public class BillingCalloutService {

    public static string STATUS_BILLABLE = 'Billable';
    public static string STATUS_BILLED = 'Billed';
    public static string OK = 'OK';

    public static void callBillingService(List < Project__c > projects, Map < Id, Project__c > mapOldProjects) {

        final String USERNAME = ServiceCredentials__c.getValues('BillingServiceCredential').Username__c;
        final String PASSWORD = ServiceCredentials__c.getValues('BillingServiceCredential').Password__c;

        for (Project__c p: projects) {
            if (p.Status__c == STATUS_BILLABLE && mapOldProjects.get(p.Id).Status__c != STATUS_BILLABLE) {

                System.debug('p >>> ' + p);

                makeCallout(
                    USERNAME,
                    PASSWORD,
                    p.ProjectRef__c,
                    p.Billable_Amount__c
                );
            }
        }

    }

    @Future(Callout = true)
    public static void makeCallout(String username, String password, String projectId, Decimal billable) {

        BillingServiceProxy.InvoicesPortSoap11 billService = new BillingServiceProxy.InvoicesPortSoap11();
        BillingServiceProxy.project proj = new BillingServiceProxy.project();


        proj.username = username;
        proj.password = password;
        proj.projectid = projectId;
        proj.billAmount = billable;

        String retorno = billService.billProject(proj);

        System.debug('retorno >>> ' + retorno);

        if (retorno.equalsIgnoreCase(OK)) {

            List < Project__c > p = [SELECT ID, Status__c FROM Project__c WHERE ProjectRef__c =: projectId];

            System.debug('p >>> ' + p);

            if (p.size() > 0) {
                p[0].Status__c = STATUS_BILLED;

                System.debug('p >>> ' + p);
                update p;
            }
        }

    }



}