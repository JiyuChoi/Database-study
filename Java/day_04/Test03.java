package day_04;

public class Test03 {

	public static void main(String[] args) {
		
		int[] num1 = new int [] {66, 77, 33, 55, 100}; // new int[] 생략 가능
		int num2[] = num1;
		int[] num3 = num2.clone(); // num2 복제 (데이터 값 변경에 영향 받지 않음)
		
		if (5 < num1.length) num1[5] = 11; // 유효범위 확인해야함 
		num2[0] = 22;
		num3[0] = 33;
		
		num1 = null;
		num2 = null;
		
		System.out.println("=========================");
		
		/* 배열은 메모리에 할당되고 나면 resizing 불가능 */
		
		int[] num4 = new int [] {5, 9, 1, 4, 3};
		int[] num5 = new int [num4.length * 2]; // 새로 배열을 만들어줘야 함 
		
		/* 배열 카피 */
		System.arraycopy(num4, 0, num5, 0, num4.length); // num4의 처음부터 복사해 num5의 처음에 붙여넣
		
		System.out.println("=========================");
		
		/* 데이터 가공: 문자열 쪼개기 */
		String[] data = "고길동/ 99/ 77/ 100".split("/");
		
		double sum = 0;
		
		for(int i = 1; i < data.length; i++) {
			sum += Double.parseDouble(data[i].trim());
			
		}
		System.out.printf("%s : %.2f %n", data[0], sum/3);
	}

}
