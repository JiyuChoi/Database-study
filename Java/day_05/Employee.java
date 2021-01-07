package day_05;

/**
 * 
 * @author choijiyu
 * @since 2020.12
 *
 */

/* 다른 패키지에도 사용가능한 클래스 생성 */
//public을 붙여야 함
public class Employee {
	// 데이터(명사) + 기능(동사)
	
	
	
	/* 데이터(명사) */
	//데이터에는 public을 붙이지 않는다. --> 다른 사람에 의해 변경될 수 있기 때문 
	protected String name;  //이름 (protected 자식한테까지 오픈)
	private String dept;  //부서
	private int age;  	  //나이 
	
	
	
	
	/* private 설정되어 있으므로 setter getter를 이용해 사용 통로 줘야함 */
	//source -> generate getters and setters
	public Employee() {
		System.out.println("Employee() 생성");
	}
	
	/* 파라미터 있는 생성자 함수 */
	public Employee(String name, String dept, int age) throws Exception {
		super();
		this.name = name;
		this.dept = dept;
		try {
		this.setAge(age);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	//<!-- 위의 함수 호출하여 함수 생성 -->
	public Employee(String name, int age) throws Exception {
		this(name, null, age); // this() 첫번째 라인 위치에만 허용 
//		this.name = name;
//		this.age = age;
	}
	
	
	

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
	
	/**
	 * @param age 양수만 가능 
	 */
	public void setAge(int age) throws Exception {
		if (age < 0) throw new  Exception ("양수를 입력하세요.");
			this.age = age;
	}
	
	public int getAge() {
		return age;
	}
	
	
	
	/**
	 * 정보출력 
	 */
	
	/* 기능(동사) */
	//세금 계산 
	public void print() { //출력 
		System.out.printf("[사원명: %s, 근무부서: %s, 나이: %d] %n", name, this.dept, this.age);
	}
}