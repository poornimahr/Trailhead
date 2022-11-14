@istest
public class TestVerifyDate {
    static testMethod void method1(){
        VerifyDate.CheckDates(system.today(),system.today()+1);
    }
    static testMethod void method2(){
        VerifyDate.CheckDates(system.today()+30,system.today()+1);
    }
}