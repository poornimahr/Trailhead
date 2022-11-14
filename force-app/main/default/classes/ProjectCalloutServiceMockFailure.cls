global class ProjectCalloutServiceMockFailure implements HttpCalloutMock{
   //Implement http mock callout failure here
    global HTTPResponse respond(HTTPRequest request) {
    // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(500);
        response.setStatus('Failure');
        return response; 
    } 
}