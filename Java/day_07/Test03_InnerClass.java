package day_07;

public class Test03_InnerClass {

	public static void main(String[] args) {
		A a = new A();
		
		A.B b = a.new B();
		
		A.B b1 = new A("~~~").new B();
		b1.print();
	}

}




class A{
	String name = "홍길동";
	
	A(){}
	A(String name){
		this.name = name;
	}
	
	
	class B{
		void print(){
			System.out.println(name);
		}
	}	
}

//Lab 시간 고민해보기 
	class B{
		A a;
		
		public A getA() {
			return a;
		}


		public void setA(A a) {
			this.a = a;
		}


		void print(){
			System.out.println(getA().name);
		}
	}




