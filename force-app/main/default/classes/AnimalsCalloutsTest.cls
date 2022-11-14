@istest
public class AnimalsCalloutsTest{
    static testMethod void testgetcallout(){
        test.setMock(httpCalloutMock.class,new AnimalhttpCalloutMock());
        httpresponse response = animalCallouts.makeGetCallout();
    }
    @istest static void testpostcallout(){
        test.setMock(httpCalloutMock.class,new AnimalhttpCalloutMock());
        httpresponse response = animalCallouts.makePostCallout();
    }
}