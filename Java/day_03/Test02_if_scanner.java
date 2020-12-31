package day_03;

import java.util.Scanner;

public class Test02_if_scanner {
	public static void main(String[] args) {
		System.out.println("성적처리 App start");
		
		int kor = 0;
		int math = 0;
		String name = null;
		
		Scanner scanner = new Scanner(System.in); // 키보드로부터 입력 받기 
		
		System.out.println("계속 진행하고 싶으면 yes를 입력하세요. 그렇지 않으면 no 입력하세요.");
		String msg = scanner.nextLine();
		
		// Yes가 아니라면 종료 
		if(!msg.equalsIgnoreCase("Yes")) {
			if(scanner != null)
				scanner.close(); //사용했다면 자원 반납 
				scanner = null;
				System.out.println("종료합니다.");
			return;
		}
		
		// Yes라면 수행 
		System.out.println("학생 이름을 입력하세요.");
		name = scanner.nextLine();
		
		System.out.println("국어 점수를 입력하세요.");
		kor = Integer.parseInt(scanner.nextLine());
		
		System.out.println("수학 점수를 입력하세요.");
		math = scanner.nextInt(); //엔터값도 같이 입력 
		scanner.nextLine(); //다음 값에 영향줄 수 있으므로 제거하는 역할 
		
		
		double avg = (kor + math) / 2.;
		String error = avg >= 0 && avg <= 100 ? "" : "점수 확인 필요"; //에러 조건 넣어주기
		
		
		// 등급처리 (if, else)
		char grade = 'F';
		
		if(avg >= 90 && avg <= 100) {
			grade = 'A';
		} else if(avg >= 80 && avg <= 89){
			grade = 'B';
		} else if (avg >= 70 && avg <= 79){
			grade = 'C';
		} else if (avg >= 60 && avg <= 69){
			grade = 'D';
		} //else
			//grade = 'F';
		
		
		// 삼항 연산자로 변환
		char grade3 = avg >= 90 && avg <= 100 ? 'A' : avg >= 80 && avg <= 89 ? 'B' : avg >= 70 && avg <= 79 ? 'C' : avg >= 60 && avg <= 69 ? 'D' : 'F';
	
		
		
		/* switch 연습 
		char gradeS = ' ';
		
		char test = '+'; // +, -, *, / 
		switch(test) { //byte, short, int, char 가능 
			case '+':
				System.out.println("+");
				break;
			case '-':
				System.out.println("-");
				break;
			case '*':
				System.out.println("*");
				break;
			case '/':
				System.out.println("/");
				break;
			default:
				System.out.println("입력 오류");
		}
		*/
		
		
		
		char gradeS = ' ';
		
		switch((int)avg/10) { // 0 ~ 10
			case 10:
			case 9:
				gradeS = 'A';
				break;
			case 8:
				gradeS = 'B';
				break;
			case 7:
				gradeS = 'C';
				break;
			case 6:
				gradeS = 'D';
				break;
			default:
				gradeS = 'F';
		
		}
		
		
		
		System.out.printf("이름: %s, 국어: %d, 수학: %d, 평균: %.2f, 등급: %c %n", name, kor, math, avg, gradeS);
		
		System.out.println(error);
		
		System.out.println("성적처리 App end");
		if(scanner != null) scanner.close(); 
		scanner = null;
		return;
	}

}