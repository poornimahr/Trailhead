@isTest
private class AwesomeCalculatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        // Call the method that invokes a callout
        Double x = 1.0;
        Double y = 2.0;
        Double result = AwesomeCalculator.add(x, y);
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
    @isTest static void testCallout2() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock2());
        // Call the method that invokes a callout
        Double x = 5.0;
        Double y = 2.0;
        Double result = AwesomeCalculator.subtract(x, y);
        // Verify that a fake result is returned
        System.assertEquals(3.0, result); 
    }
}