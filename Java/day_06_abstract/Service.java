package day_06_abstract;

public interface Service { //interface의 요소는 추상 메소드 

	/* abstract가 메뉴라면 interface는 메뉴판 */

	// interface 객체 생성 불가능 (미완성의 코드) 
	void delete(); // public 생략 
	void update();
	abstract void insert();
}


// 위의 인터페이스를 구현하겠다. 

class OracleServiceImp1 implements Service {
	@Override
	public void delete() {
		System.out.println("oracle delete 작업수행");
	}
	
	@Override
	public void update() {
		System.out.println("oracle update 작업수행");
	}
	
	@Override
	public void insert() {
		System.out.println("oracle insert 작업수행");
	}
	
}


class MySqlServiceIMP1 implements Service {
	@Override
	public void delete() {
		System.out.println("MySql delete 작업수행");
	}
	
	@Override
	public void update() {
		System.out.println("MySql update 작업수행");
	}
	
	@Override
	public void insert() {
		System.out.println("MySql insert 작업수행");
	}
	
	
}