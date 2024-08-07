public with sharing class FutureApexDemo {
    public FutureApexDemo() {
    
        demo1();
        demo2();
        demo3();
        demo4();
    }
  
    public static void demo1(){
        System.debug('this is 1st demo');
    }
    public static void demo2(){
        System.debug('this is 2nd demo');
    }
    public static void demo3(){
        System.debug('this is 3rd demo');
    }
    public static void demo4(){
        System.debug('this is 4th demo');
    }
    public static void demo(){
        System.debug('this is only demo');
    }
}