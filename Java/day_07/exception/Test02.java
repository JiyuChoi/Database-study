package day_07.exception;

public class Test02 {

	public static void main(String[] args) {
		System.out.println("start");
		
		try {
			int num = 10;
			if(num % 2 == 0) throw new RuntimeException("~~~");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		
		try {
			Thread.sleep(3000); //일정시간 잠잔 후에 출력 
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		System.out.println("end");
	}

}
