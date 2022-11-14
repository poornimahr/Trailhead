@istest
global class CalculatorCalloutMock2 implements webservicemock{
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
        calculatorServices.doSubtractresponse response_x = new calculatorServices.doSubtractResponse();
        response_x.return_x = 3.0;
        response.put('response_x', response_x);
    }
}