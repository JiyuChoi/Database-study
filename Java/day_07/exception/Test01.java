package day_07.exception;

public class Test01 {

	public static void main(String[] args) {
		System.out.println("start");
		
		String msg = "9";
		int num = 0;
		String[] s = new String[num];
		
		try {
			System.out.println("try block 1");
			
			num = Integer.parseInt(msg);
			
			System.out.println("try block 2");
			
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());
//			e.printStackTrace();
			System.out.println("숫자를 입력하세요.");
		
		} catch (NegativeArraySizeException e) {
			System.out.println("양수를 입력하세요.");
		
		} finally {
			s = null;
			System.out.println("자원반납");
		}
		
		
		System.out.println(num);
		
		System.out.println("end");

	}

}
