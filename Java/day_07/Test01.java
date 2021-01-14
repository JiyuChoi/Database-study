package day_07;

import day_05.Employee;

public class Test01 {

	public static void main(String[] args) {
		new Employee(); 

	}

}

/* 접근 지정자 
 * private / default / protected / public
 * */
class SalesEmployee extends Employee{//day05 상속 받음 
	SalesEmployee(){
		name = "홍길동";
	}
	
	public void print() {
		System.out.println(this.name); // protected: 자식한테까지만 오픈!
	}
}