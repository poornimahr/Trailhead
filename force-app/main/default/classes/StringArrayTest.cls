public class StringArrayTest{
    public static list<string> generateStringArray(Integer n){
        List<String> returnList = new list<String>();
        for(integer i=0 ; i<n;i++){
            returnList.add('Test '+i);    
        }
        return returnList;
    }
}