package day_03;

public class Test07_StringBuilder {
	

	public static void main(String[] args) {
		String msg = "hello" + "," + 1 + "java"; // String 연결시 사용 X
		System.out.println(msg);
		
		
//		StringBuffer sb = new StringBuffer();
		StringBuilder sb = new StringBuilder();//StringBuilder 사용 
		sb.append("hello");
		sb.append(",");
		sb.append("java");
		sb.append(1);
		sb.append(",");
		sb.append("spring");
		
		String result = sb.toString();
		
		System.out.println(result);
		
		
	}
}
