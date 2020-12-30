package day_02;

import javax.swing.JOptionPane;

public class Prob2 {
	
	public static void main(String[] args) {
	/*
	아래는 변수 num의 값에따라  양수 음수  0을 출력하는  코드이다.
	삼항 연산자를 이용해서 에 알맞은 코드를 완성하세요. 
	*/
		int num = Integer.parseInt(JOptionPane.showInputDialog("숫자를 입력하세요"));
		String res = num > 0 ? "양수" : (num < 0 ? "음수" : "0");
	        System.out.printf("%d = %s %n", num, res);    
	        
        
	        
    /*
    다음은 대문자를 소문자로 변경하는 코드입니다. ch+32
    변수 ch에 저장된 문자가 대문자인 경우에만 
	소문자로 변경하는 코드를 완성 합니다.
  	*/ 
		char ch = (JOptionPane.showInputDialog("문자를 입력하세요").charAt(0)); //?
		/*if(ch >= 65 && ch <= 90) {
			System.out.println((char)(ch+32));
			}*/
		char rec = ch >= 'A' && ch <= 'Z' ? (char)(ch+32):ch;
		//char rec2 = Character.isUpperCase(ch)? (char)(ch+32):ch; //위에 거가 더 효율적 
		System.out.printf("%c -> %c %n", ch, rec);
	
	
	
		
	/* 구구단을 만들어봅니다. */
		for(int i=1; i<10; i++) {
			for(int j=1; j<10; j++) {
				System.out.printf("%d*%d=%2d|",j, i, i*j);
			}
			System.out.println();
		}
	
	
	}
}