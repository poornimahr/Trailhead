@istest
global class CalculatorCalloutMock implements webservicemock{
    global void doinvoke(
        Object stub, 
        Object request, 
        Map<String,Object> response, 
        String endpoint, 
        String soapaction, 
        String requestname, 
        String responseNS, 
        String responsename, 
        String responsetype
    ){
        calculatorServices.doAddresponse response_x = new calculatorServices.doaddResponse();
        response_x.return_x = 3.0;
        response.put('response_x', response_x);
    }
}