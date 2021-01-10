package day_06_abstract;

public class Dog extends Animal {
	String kind = "강아지 종류";
	String name;
	
	
	public Dog(){
		super("강아지");
//		super.kind = "강아지";
	} // 기본 생성자는 만들어주자! 
	
	
	public Dog(String kind, String name){
		super("강아지");
//		super.kind = "강아지";
		this.kind = kind;
		this.name = name;
	} 
	
	
	@Override
	public void print() {
		System.out.printf("Dog[%s : %s : %s] %n", super.kind, this.kind, name);
	}
	
	@Override
	public void breath() {
		System.out.println("폐로 숨쉬기...");
	}
	
	public static void main(String[] args) {
		Dog d1 = new Dog();
		Dog d = new Dog("시츄", "캐리");
		System.out.println(d.kind);
		System.out.println(d.name);
		d.breath();
		d.print();
	}
}
