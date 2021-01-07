package day_05;

import day_04.Employee;

public class Test01_GetSet {
	public static void main(String[] args) {
		
		Employee emp1 = new Employee();
//		emp1.name = "홍길동";
//		emp1.dept = "기술부";
		emp1.setName("홍길동");
		emp1.setDept("기술부");
		emp1.setAge(-29); // age < 0이므로 기본 값 0이 나온다 
		emp1.setAge(29);
		
		emp1.print();

		Employee emp2 = null;
		if (emp2 != null) System.out.println(emp2.getDept()); //주소가 있어야만 함, instance 자원  
		
		System.out.println(Math.random()); //주소가 없어도 됨, static한 자원 
	}

}
