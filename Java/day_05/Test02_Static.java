package day_05;

import util.Calc;

public class Test02_Static {
	public static void main(String[] args) {
		
		// static한 자원은 이미 메모리에 떠있음: new가 필요 없음
		// Class 이름으로 접근 가능 
		
//		Calc c1 = new Calc();
//		Calc c2 = new Calc();
//		Calc c3 = new Calc();
//		Calc c4 = new Calc();
		
		
//		int a = Calc.add(111, 4343);
//		int b = Calc.sub(9, 11);
		
//		System.out.println(Calc.multi(a, b));
		
//		int res = Calc.multi(2, 2);
//		int res2 = Calc.multi(  2+2+2  , Calc.add(9, 9));
		
		System.out.println("------------");
		
		System.out.println(Calc.add(5, 5));
		System.out.println(Calc.add(1, 2, 3));
		
		System.out.println(Calc.add(5, 5.5));
		System.out.println(Calc.add(5.5, 5.5));
		
		System.out.println("------------");
		System.out.println(true);
		System.out.println('a');
		System.out.println(99.99999);
	}

}
