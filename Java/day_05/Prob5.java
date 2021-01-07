package day_05;

public class Prob5 {
	public static void main(String args[]) {


		/* 문제1. Prob5내에 leftPad 메쏘드를 작성하십시오. 
       leftPad 메쏘드의 속성은 다음과 같습니다.*/
		Prob5 p = new Prob5();
		
		System.out.println( Prob5.leftPad("SDS", 6, '#') );
		System.out.println( Prob5.leftPad("SDS", 5, '$') ); 
		System.out.println( Prob5.leftPad("SDS", 2, '&') ); 
//		System.out.println( p.rightPad("SDS", 6, '&') ); 
	}
	
	
	public static String leftPad(String str, int size, char padChar) {
		 
		/*  여기에 프로그램을 완성하십시오. */
		StringBuilder sb = new StringBuilder();
//		String res = "";		 // 이렇게 더하기 하면 효율성 떨어짐 
		int n =  size - str.length();
		
		//입력 문자열의 길이가 입력받은 수보다 큰 경우 
		if (n < 0) {
			return str;
		}
		for (int i = 0; i < n; i++) {
			sb.append(padChar);
		}
			sb.append(str);
			return sb.toString();
		}

/* rightPad 인스턴스 메소드 만들기 */
	public String rightPad(String str, int size, char padChar) {
		
		
		StringBuilder sb = new StringBuilder(str);
		
		int n =  size - str.length();
		
		//입력 문자열의 길이가 입력받은 수보다 큰 경우 
		if (n < 0) {
			return str;
		}
		for (int i = 0; i < n; i++) {
			sb.append(padChar);
		}
			return sb.toString();
		}
	
	
	
	
	/* sort 함수 추가 선언부 작성,
	 * 1. 정렬할 int 배열을 넘겨 받고 오름 차순으로 정렬후  정렬 결과를 리턴한다. */
	
	public int[] sort (int[] arr){
		int[] res = arr.clone(); //주소가 변경될 수 있으므로 원본을 복사
		//정렬 알고리즘 (선택 정렬) 
		return res;
	}
}
