public class ParkLocator{
    public static List<String> Country(String country) {
        ParkService.ParksImplPort getCountry= 
            new ParkService.ParksImplPort();
        return getCountry.byCountry(country) ;
    }
}