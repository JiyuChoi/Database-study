package day_07.exception;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Test03 {

	public static void main(String[] args) {
		System.out.println("start");
		Scanner scanner = null;
		
		try {
			scanner = new Scanner(new File("data.txt"));
			while (scanner.hasNextLine()) {
				System.out.println(scanner.nextLine());
				
			}
		} catch(FileNotFoundException e) {
			System.out.println("data.txt 파일 준비하세요.");
		} finally {
			if (scanner != null) {
				scanner.close();
				scanner = null;
			}
		}
		System.out.println("end");
		
	}

}
