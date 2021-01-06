package day_04;

import java.util.Arrays;

public class Test02 {
	public static void main(String[] args) {
		
		int [] num = {5,9,3,7,11,45,23};
		System.out.println(Arrays.toString(num));
		
		String[] names = new String[] {"홍길동", "김둘리", "또치", "도우너", "희동이"};
		System.out.println(Arrays.toString(names));
		
		// num 배열에서 50번 학생 찾기
		for (int i = 0; i < num.length ;i++) {
			if (num[i] == 7) {
				System.out.printf("O -> 위치 %d %n", i+1);
				break;
			}
			System.out.println("배열에 7번이 없습니다.");
		}
		
				
		// names 배열에서 김길동 찾기 
		for (int i = 0; i < names.length ;i++) {
			if (names[i].equals("홍길동")) {
				System.out.printf("O -> 위치 %d %n", i+1);
				break;
			}
		}
		
		// names 배열에서 이름이 두글자인 사람만 출력하기  
		for (int i = 0; i < names.length ;i++) { 	//배열의 사이즈: length
			if (names[i].length() == 2) { 	//문자열의 길이: length()
				System.out.println(names[i]);
				break;
			}
		}
		
		System.out.println("=========================");
		for (String data : names) {   // .연산자 가능 
			System.out.printf("%s, %c** %n", data, data.charAt(0));
		}
		
		System.out.println("=========================");
		
		
		boolean [] flag = new boolean[5];
		char [] ch = "hello java ~~~".toCharArray();

		System.out.println("=========================");
	}
}
