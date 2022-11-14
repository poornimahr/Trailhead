public class AnimalCallouts{
    public static httpresponse makeGetCallout(){
        http http = new http();
        httpRequest request = new httpRequest();
        request.setMethod('GET');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        httpResponse response = http.send(request);
        system.debug('response-----'+response.getstatusCode());
        system.debug('response body--'+response.getbody());
        Map<string,object> results = (map<string,object>)json.deserializeUntyped(response.getbody());
        List<object> animals = (List<object>)results.get('animals');
        system.debug('animals------'+animals);
        return response;
    }
    public static httpresponse makePostCallout(){
        http http = new http();
        httpRequest request = new httpRequest();
        request.setMethod('POST');
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setHeader('Content-Type','application/json');
        request.setbody('{"name":"Garanimals"}');
        httpResponse response = http.send(request);
        system.debug('response-----'+response.getstatusCode());
        system.debug('response body--'+response.getbody());
        Map<string,object> results = (map<string,object>)json.deserializeUntyped(response.getbody());
        List<object> animals = (List<object>)results.get('animals');
        system.debug('animals------'+animals);
        return response;
    }
}