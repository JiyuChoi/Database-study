package day_04;

public class Test05_TwoArray {
	
	public static void main(String[] args) {
		
		/* 1차원 배열을 모아 관리하는게 2차원 배열 */
		int[] num1 = {1,1,1,1,1};
		int[] num2 = {2,2,2,2,2};
		int[] num3 = {3,3,3,3,3};
		
		int[][] two = {num1, num2, num3};
		
		for(int row = 0; row < two.length; row++) {
			for(int col = 0; col < two[row].length; col++) {
				System.out.printf("%d", two[row][col]);
			}
			System.out.println();
		}
		
		
		System.out.println("=========================");
		
		
		int N = 7;
		int[][] two1 = new int[N][N];
		two[2][3] = 99;
		
		
		System.out.println("=========================");
		
		
		/* 반별 성적 데이터 */
		int[][] two2 = {
				{},
				{90, 40, 88, 99, 89},
				{33, 99, 44, 77, 88, 67, 89},
				{99, 88, 100}
		};
		
		
		/* 반별 평균 점수 */
		for (int i = 1; i < two2.length; i++) {
			double sum = 0;
			int count = two2[i].length;  // 변수화 해준
			for (int j = 0; j < count; j++) {
				sum += two2[i][j];
			}
			System.out.printf("%d반 평균은 %.2f점 입니다. 응시인원: %d명 %n", i, sum/count, count);
		}
		
	}
}
