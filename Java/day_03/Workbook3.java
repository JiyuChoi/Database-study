package day_03;

public class Workbook3 {

	public static void main(String[] args) {
	

	/*[1] int형 변수 year가 400으로 나눠떨어지거나 
	또는 4로 나눠떨어지고  
    100 나눠떨어지지 않을 때인 조건식을 만들어 보세요(윤년공식).*/	
		
		int year = 1300;	
		if (year % 400 == 0 || (year%4 == 0 && year%100 != 0)) {
			System.out.println("윤년입니다.");
		} else {
				System.out.println("윤년이 아닙니다.");
			}
	
		
	/*[2] 1부터 20까지의 정수 중에서 
    2또는 3의 배수가 아닌 수의 총합을 구해 보세요.*/

		int sum = 0; 
		for(int i=1; i<=20; i++) {
			if(i%2!=0 || i%3!=0) {
				sum += i;
			}
		}
		System.out.println("sum = "+sum);  

		
	/*[3] 1+(1+2)+(1+2+3)+(1+2+3+4)+...+(1+2+3+...+10)의 결과를 구해 보세요*/
		
		int tot = 0;
		for(int i=1; i<=10; i++) {
			for(int j=1; j<=i; j++) {
				tot += j;
			}
		}
		System.out.println("tot = "+tot);


	}
}
