package day_07;

import java.util.Stack;

public class StackTest {

	public static void main(String[] args) {
		Stack<Integer> s = new Stack<Integer>();
		
		MyStack stack = new MyStack(10);
		if(stack.isEmpty()){
			System.out.println("스택이 비어있습니다.");
		}
		
		for (int i = 1; i <= 10; i++) {
			stack.push(i);
		}
		
		if(stack.isFull()){
			System.out.println("스택이 가득 찼습니다.");
		}
		
		System.out.println("최상위 숫자 : " + stack.peek());
		System.out.println("최상위에서 꺼낸 숫자 : " + stack.pop());
		System.out.println("최상위에서 꺼낸 숫자 : " + stack.pop());
		System.out.println("");
		System.out.println("== 스택 리스트 ==");
		for (int i = 1; i <= 10; i++) {
			int num = stack.pop();
			if(num != -1)
				System.out.println(num);
		}
		for (int i = 1; i <= 100; i++) {
			stack.push(i);
		}
	}
}



class MyStack{
	int[] stack;
    int count = 0;
    
	public MyStack() {
		stack = new int[10];
	}

	public MyStack(int size) {
		stack = new int[size>0?size:10];
	} 
	
	public boolean isEmpty() {
		return count==0 ? true:false;
	}
	
	public boolean isFull() {
		return count==stack.length? true: false;
	}
	
	
	public void push(int i) {
		if(isFull()) {
			System.out.println("스택이 가득 찼습니다.==>stack 이 리사이징 됨 ");
			int[] temp = new int[stack.length*2];
			System.arraycopy(stack, 0, temp, 0, stack.length);
			stack = temp;
			temp = null;
		}else {
			stack[count++] = i;
		}
	}
	
	public int peek() {
		return  count==0?-1:stack[count-1];
	}
	
	public int pop() {
		int data = -1;
		if(!isEmpty()) {
          data = stack[count-1];
          stack[count-1] = 0;
          count--;
		}
		return data;
	}
	
}

