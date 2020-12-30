package day_02;

public class Test03 {

	public static void main(String[] args) {
		int num = (int)(Math.random()*100);
		System.out.println(num);
		
		System.out.println(Double.parseDouble("99")+99.99);
		
		int num1 = Integer.parseInt("99");			//문자열 정수 형변환 
		double num2 = Double.parseDouble("99.99");
		
		//Wrapper Class: Integer, Character, Byte, Double, Float 
		
		System.out.printf("Byte : %d ~ %d %n", Byte.MIN_VALUE, Byte.MAX_VALUE);
		System.out.printf("int : %d ~ %d %n", Integer.MIN_VALUE, Integer.MAX_VALUE);
		
		
		
		System.out.println('A' + "=>" + (int)'A');
		System.out.println('B' + "=>" + (int)'B');
		System.out.println('C' + "=>" + (int)'C');
		System.out.println('Y' + "=>" + (int)'Y');
		System.out.println('Z' + "=>" + (int)'Z');
		
		System.out.println('a' + "=>" + (int)'a');
		System.out.println('b' + "=>" + (int)'b');
		System.out.println('c' + "=>" + (int)'c');
		System.out.println('y' + "=>" + (int)'y');
		System.out.println('z' + "=>" + (int)'z');
		
		System.out.println((int)'9');
		
		//대문자로 변환 알고리즘 (32 차이)
		
		
		char ch = '1'; //숫자인지 판별 -> ch >= '0' && ch <= '9'
		System.out.printf("%c 숫자니? %b %n", ch, ch >= '0' && ch <= '9');
		System.out.printf("%c 숫자니? %b %n", ch, Character.isDigit(ch)); //isDigit (숫자 판별)
		
		int x = 9, y = 1;
		System.out.printf("(x=%d, y=%d) %n", x, y);
		//스와핑 
		int tmp = x;
		x = y;
		y = tmp;
		System.out.printf("(x=%d, y=%d) %n", x, y);
		
		char c1 = 'a', c2 = 'p'; //문자도 가능 

		System.out.println("   hello  java   ".trim()); //"hello  java" (trim: 양옆 공백 제거)
		System.out.println("   hello  java   ".length()); //17
		System.out.println("   hello  java   ".trim().length());  //11 
		System.out.println("   hello  java   ".trim().charAt(4)); //o
		System.out.println("   hello  java   ".trim().toUpperCase()); //HELLO  JAVA
	
	}

}
