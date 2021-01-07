package day_05;

import java.util.Calendar;

public class Test05_Singleton {

	public static void main(String[] args) {
		
		Singleton s1 = Singleton.getInstance();
		System.out.println(s1);
		Singleton s2 = Singleton.getInstance();
		System.out.println(s2);
		Singleton s3 = Singleton.getInstance();
		System.out.println(s3);
		Singleton s4 = Singleton.getInstance();
		System.out.println(s4);
		
		System.out.println("----------------");
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		
		System.out.println("----------------");
		
		new String();
		new String("ABC");
		new String("ABCDEFG".toCharArray());
		new String("ABCDEFG".toCharArray(),2,5);
		
	}

}

/* 싱글턴 패턴 */
// 모두 new로 생성 가능한 것은 아니다! 
class Singleton{
	static Singleton s = new Singleton();
	
	private Singleton() {	}
	
	public static Singleton getInstance() {
		return s;
	}
}
