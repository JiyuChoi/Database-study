/* 3가지 풀이
 * 내 풀이 (if문)
 * 삼항 연산자 
 * stringBuilder 
*/

package day_03;

public class Prob3 {
	
	public static void main(String[] args) {
		
		String sourceString = 
				"everyday we have is one more than we deserve";
				String encodedString = "";
				
				
				StringBuilder sb = new StringBuilder();
				// 프로그램을 구현부 시작.	
				// 참고 : 문자 'a'의 정수값은 97이며, 'z'는 122입니다. 
				
				
				 for(int i = 0; i < sourceString.length(); i++) {
					char ch = sourceString.charAt(i);
				
				/* <!-- 내 풀이 --> 	
					if(ch != ' ') {
						ch += 3; 
					}
					if(ch > 'z') {
						ch -= 26;
					}
					encodedString += ch;
				}*/
				
					char r = ch >= 'a' && ch <= 'w' ? (char)(ch+3): ch >= 'x' && ch <= 'z' ? (char)(ch-23) : ch;
//					encodedString += r;
					sb.append(r);
				 }
					

				// 프로그램 구현부 끝.
				encodedString = sb.toString();
				System.out.println("암호화할 문자열 : " + sourceString);
				System.out.println("암호화된 문자열 : " + encodedString);
		
	}
}
