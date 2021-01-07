package day_05;

public class Test03 {
	public static void main(String[] args) {
		
		Employee emp1 = new Employee();
		emp1.print();

		/* 파라미터 있는 생성자 함수 생성 및 데이터 입력 */
		Employee emp2 = new Employee("홍길동","기술부",28);
		emp2.print();
		
		Employee emp3 = new Employee("고길동","영업부",29);
		emp3.print();
		
		Employee emp4 = new Employee("이길동",29);
		emp4.print();
	}

}
