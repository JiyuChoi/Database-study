package day_04;

public class Prob4 {

	public static void main(String[] args) {
		
		String[] strData  = { "Java Programming" , "JDBC", "Oracle10g", "JSP/Servlet" };
		// 배열 읽기 
		for (int i = 0; i < strData.length; i++) {
			// 배열의 원소 값 거꾸로 읽기 
			for (int j = strData[i].length()-1 ; j >= 0; j--) {
				System.out.printf("%c", strData[i].charAt(j));
			}
			System.out.println();
		}
	}
}

/* for (int j = 0; i < strData,length; i++){
		char[] ch = strData[i].toCharArray();
		for (int idx = ch.length-1; idx >= 0; idx--){
			System.out.print(ch[idx]);
			}
			System.out.println();
		} 
*/
