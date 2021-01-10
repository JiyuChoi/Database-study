package day_06_abstract;

public class Test01 {

	public static void main(String[] args) {
		Dog[] dogs = {new Dog(), new Dog("진돗개", "캐리")};
		Fish[] fishs = {new Fish("쿠피"), new Fish()};
		
		Animal[] animals = {
				new Dog(),
				new Dog("진돗개", "캐리"),
				new Fish("쿠피"),
				new Fish()
		};
		
		for (Animal data : animals) {
			data.print();
			data.breath();
			
		}
		
	}
}
