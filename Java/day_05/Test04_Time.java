package day_05;

public class Test04_Time {

	public static void main(String[] args) {
		
		Location loc = new Location();
		
		Time t1 = new Time();
		t1.print();
		
	}
}


class Location {
	double x;
	double y;
}


/* 그룹 지어서 관리: Class가 용이 */
class Time{
	private int hour;
	private int minute;
	private int second;
	private boolean am;
	
	
	public Time() {
	}

	public Time(int hour, int minute, int second) {
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}
	
	
	// get 대신 is method 사용 
	public boolean isAm() {
		return am;
	}

	public void setAm(boolean am) {
		this.am = am;
	}

	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMinute() {
		return minute;
	}
	public void setMinute(int minute) {
		this.minute = minute;
	}
	public int getSecond() {
		return second;
	}
	public void setSecond(int second) {
		this.second = second;
	}
	
	public void print() {
		System.out.printf("%d:%d:%d", hour, minute, second);
	}
}