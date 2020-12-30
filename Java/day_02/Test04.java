package day_02;

public class Test04 {

	public static void main(String[] args) {
		int x = 100, y = 7;
		System.out.println(x/y); // 몫 (정수 연산일때만) 
		System.out.println(x%y); // 나머지 

		int num = 100;
		System.out.println(num++); // 프린트하고 덧셈 
		System.out.println(num);
		System.out.println(++num); // 덧셈하고 프린트 
		
		
		String msg = null; 
		msg = "Hello Java";
		int idx = 11;
		
		if(msg != null && idx >= 0 && idx < msg.length()) {
			// 앞에거(msg != null) True 나올 때만 length 계산. False이면 뒤에거 계산 X
			System.out.println(msg.toUpperCase().charAt(idx));	
		}
		else {
			System.out.println("msg가 null이거나 유효하지 않은 idx입니다.");
		}
		
		
		
		/* 비트 연산자 */
		System.out.println(4<<2); //16		0000 0100 => 0000 1000
		System.out.println(4>>1); //2		0000 0100 => 0000 0010
		System.out.println(4&1); //0		0100 & 0001 => 0000
		System.out.println(4|1); //5	    0100 | 0001 => 01001
		
		
		/* 삼항 연산자 */
		int jumsu = -60;
		if (jumsu >= 0 && jumsu <= 100) {
			
				//jumsu > 70 ? true : false;
			String res = jumsu > 70 ? "합격" : "재시"; //두 개의 데이터 형을 이치 시켜야 함
			System.out.printf("취득점수 : %d => %s %n", jumsu, res);
			System.out.println(jumsu > 70 ? "합격" : "재시");
		}
		
		
		System.out.println("END");
		return;
	}
}
