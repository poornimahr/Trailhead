@isTest 
public class AnimalLocatorTest{
    static testMethod void AnimalLocatorTest() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String response = AnimalLocator.getAnimalNameById(1);
    String expectedValue = 'chicken';
    System.assertEquals(response , expectedValue);
}
}