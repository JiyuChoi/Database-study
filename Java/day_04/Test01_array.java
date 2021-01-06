package day_04;

import java.util.Arrays;

public class Test01_array {
	public static void main(String[] args) {
//  1) Array 선언		2) Array 생성		3) Array 초기화
		
		int[] jumsu = null; // 배열은 주소 참조 
		jumsu = new int[5];
		System.out.println(Arrays.toString(jumsu)); // 자동으로 값이 디폴트 됨 
		jumsu[0] = 99;
		jumsu[1] = 100;
		jumsu[2] = 89;
		jumsu[3] = 99;
		jumsu[4] = 79;
		
		int sum = 0;
		for (int i = 0; i<jumsu.length; i++) {
			sum += jumsu[i];
			System.out.println(jumsu[i]);
		}
		
		System.out.println(sum);
		System.out.println(sum/jumsu.length);
		
		
		System.out.println("=========================");
		// 데이터 순회하는 방법 (한 번에 많은 데이터 출력)
		for (int data : jumsu) {
			System.out.println(data);
		}
		
		
		System.out.println("=========================");
		int [] num = new int[10];
		System.out.println(Arrays.toString(num));
		for (int i = 0; i < num.length; i++) {
			num[i] = (int)(Math.random()*100);
		}
		
		
		sum = 0;
		for (int data : num) {
			sum += data;
			System.out.printf("%d,", data);		
		}
		System.out.println(sum);

	}
}
