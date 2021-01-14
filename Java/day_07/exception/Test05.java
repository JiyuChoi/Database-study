package day_07.exception;

import day_05.Employee;

public class Test05 {

	public static void main(String[] args) throws Exception{
		
		Employee e1 = new Employee("홍길동", "기술부", -29);
		System.out.println(e1);
		
		Employee e2 = new Employee();
		
		try {
			e2.setAge(31);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(e2);
		
	}

}
