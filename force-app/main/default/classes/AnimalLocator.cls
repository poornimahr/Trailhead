public class AnimalLocator{
    public static string getAnimalNameById(integer id){
        string animalId = string.valueOf(id);
        string name = null;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String,Object> animals = (Map<String,Object>) results.get('animal');
            name = (String)animals.get('name');
            System.debug('Received the following animals:'+animals );
        }
        return name;
    }
}