@istest
public class MaintenanceRequestTest{
    static testMethod void MaintenanceRequestTest(){
        Case c = new Case();
        c.Type = 'Mechanical';
        c.Status = 'New';
        c.Origin = 'Phone';
        
        insert c;
        
        c.Status='Closed';
        c.Type = 'Routine Maintenance';
        update c;

    }
}