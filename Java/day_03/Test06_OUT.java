package day_03;

public class Test06_OUT {

	public static void main(String[] args) {
		
	OUT: for(int i=1; i<10; i++) {
			for(int j=2; j<10; j++) {
//				if(j==5) break;
//				if(j==5) continue;
				if(j==5) break OUT; //OUT 라벨을 달면 j=5일 때 전체 반복문을 빠져나온다. 
				
				System.out.printf("%d * %d = %2d|", j, i, j*i); //2글자로 출력하려면 2d 
			}
			System.out.println();	
		}
	}
}
