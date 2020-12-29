package day_01;

public class Test04 {
	//Class의 구성요소 = 데이터 (변수) + 기능 (함수)
	
	public static void main(String[] args) {
		
		//-- 기본형 데이터 (변수에 데이터가 들어감) --//
		int num1 = (int)9999999999l; //casting 필요 
		System.out.printf("%d %n", num1);
		
		double num2 = 99.9f; //float도 f마킹 필요 
		System.out.printf("%.2f %n", num2);
		
		char ch = 'A';
		System.out.printf("%c, %c %n", ch, ++ch);
		
		
		boolean flag = 10 == 9;
		System.out.printf("10 == 9 -> %b %n", flag);
		// %s도 가능 
		
		int a = 65, b = 66;
		boolean flag2 = a > b;
		System.out.printf("%d > %d -> %b %n", a, b, flag2);
	
		//-- 참조형 데이터 (변수에 주소가 들어감) --//
		String name = "홍길동";
		System.out.println(name.charAt(0)+"**");
		
	}
}
