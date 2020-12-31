package day_03;

import javax.swing.JOptionPane;

public class Test04_for {

	public static void main(String[] args) {
		
		/* for문 */
		int num = 99;
		
		int i; //for문 밖에서 변수 선언해도 가능 
		for(i = 0; i < 10; i=i+2) {
			System.out.println("Hello java " + i);
		}
		
		System.out.println(i);
		System.out.println("-------------------");

		for(int count = 9; count > 5; count--) {
		System.out.println("html5");
		}
		
		for(int count = 0;;count ++) { // 조건 명시 안하면 무한루프 
			System.out.println("~~~~");
			if (count == 4) break; // 제약 조건 걸어줘야
		}
		
		
		System.out.println("-------------------");
		
		
		/* While */
		i = 0;
		while(i < 5) {
			System.out.println("while loop "+i);
			i++;
		}
		
		
		String msg ="";
		boolean flag = false;
		while(!flag) {
			msg = JOptionPane.showInputDialog("종료를 원하면 QUIT");
			System.out.println("입력값 : "+msg);
			if(msg.equalsIgnoreCase("quit")) flag = !flag;
		}
		
		
		// do while: 최소한 한 번은 출력 
		i = 9;
		do { 
			System.out.println("while loop "+i);
			i++;
		} while(i < 5);
		
		
	}
}
