@istest
global class animalHttpCalloutMock implements HttpCalloutMock{
    global httpResponse respond(HTTPRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type','Application/JSON');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setstatusCode(200);
        return response;
    }
}