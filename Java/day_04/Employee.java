package day_04;

/* 다른 패키지에도 사용가능한 클래스 생성 */
//public을 붙여야 함
public class Employee {
	// 데이터(명사) + 기능(동사)
	
	
	/* 데이터(명사) */
	//데이터에는 public을 붙이지 않는다. --> 다른 사람에 의해 변경될 수 있기 때문 
	private String name;  //이름
	private String dept;  //부서
	private int age;  	  //나이 
	
	

	/* private 설정되어 있으므로 setter getter를 이용해 사용 통로 줘야함 */
	//source -> generate getters and setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public void setAge(int age) {
		if (age > 0)
			this.age = age;
	}
	
	public int getAge() {
		return age;
	}
	
	
	/* 기능(동사) */
	//세금 계산 
	public void print() { //출력 
		System.out.printf("[사원명: %s, 근무부서: %s, 나이: %d] %n", name, this.dept, this.age);
	}
}