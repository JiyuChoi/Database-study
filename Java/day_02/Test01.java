package day_02;

import java.util.Date;
//import java.sql.Date;

public class Test01 {
	// 클래스의 구성요소
	// 변수(멤버 변수) + 기능(method 함수)
	
	int num;
	String name;

	public static void main(String[] args) {
		// 변수, 지역변수, 초기화를 해야 사용 가능
		
		/* 기본형 */
		int num = 0; //변수 선언 및 초기화 필요 (정수로 가능)
		num = 99;
		System.out.println(num);
		
		
		/* String은 참조형이지만 세미 타입처럼 사용 가능 */
		java.lang.String name1 = null; //java.lang 생략가능 
		String name2 = null;		   //초기화 필요 (null은 주로 주소의 초기화 작업에 사용)
		
		name1 = new String("홍길동"); //메모리 효율성을 위해 이 방법 사용 X (heap) 
		name2 = "고길동"; 			//유일하게 String만 두 방식으로 표현 가능 (코드표 영역) 
				
		System.out.println(name1);
		System.out.println(name2);
		
		name1 = null;
		
		
		/* 참조형 */ 
		java.util.Date now = new java.util.Date(); //풀패스를 써줘야함 
		Date now1 = new Date(); //위에 import를 써주면 생략가능 

		System.out.println(now);

		java.sql.Date now2 = new java.sql.Date(System.currentTimeMillis());
		System.out.println(now2);
	}

}
