package day_03;

import java.util.Scanner;

public class Test03_switch {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String floor = scanner.nextLine();

		switch(floor.trim()) {
			case "1":
				System.out.println("1층 약국입니다.");
				break;
			case "2":
				System.out.println("2층 피부과입니다.");
				break;
			case "3":
				System.out.println("3층 내과입니다.");
				break;
			case "4":
				System.out.println("4층 스포츠센터입니다.");
				break;
			default:
			
		}
	}

}
