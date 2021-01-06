package day_04;

public class Test06_Class {
	
	public static void main(String[] args) {
		//랩 시간에 이해할 부분 
		Emp emp1 = new Emp(); //주소가 들어감
		emp1.name = "홍길동";
		emp1.dept="기술부";	
		emp1.age=29;
//		emp1.print();
		
		Emp emp2 = new Emp();
		emp2.name = "고길동";
		emp2.dept="영업부";	
		emp2.age=27;
//		emp2.print();
		
		Emp emp3 = new Emp();
		emp3.print();
		
		System.out.println("===================================");
		
		Emp[] Emps1 = new Emp[100];
		Emp[] Emps = {emp1, emp2, emp3, null, null, null, null};
		
		
		// Emps에서 영업부에 근무하는 사원 목록 (오류 해결)
		for (int i = 0; i < Emps.length; i++) {
			if (Emps[i] != null && Emps[i].dept != null && Emps[i].dept.equals("영업부")) {
				Emps[i].print();
				}
			}
		
		// Emps에서 성이 홍씨인 이름 검색 
		for (int i = 0; i < Emps.length; i++) {
			if (Emps[i] != null && Emps[i].name != null && Emps[i].name.charAt(0) == '홍') {
				Emps[i].print();
				}
			}
		
	}
}

/* 클래스 생성 */

class Emp {
	// 데이터(명사) + 기능(동사)
	
	/* 데이터(명사) */
	String name;  //이름
	String dept;  //부서
	int age;  	  //나이 
	
	/* 기능(동사) */
	//세금 계산 
	public void print() { //출력 
		System.out.printf("[사원명: %s, 근무부서: %s, 나이: %d] %n", name, dept, age);
	}
}



