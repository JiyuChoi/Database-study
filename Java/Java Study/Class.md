# Java Class

## Class
* 객체를 정의하는 틀 또는 설계도, 이러한 설계도를 가지고 여러 객체를 생성
* 클래스 = 객체의 상태(필드) + 객체의 행위(메서드)

## Instance
* 클래스를 이용해 객체 생성 후, 객체를 new 생성자로 할당하게 되면 인스턴스 생성
* Student students = new Student();

## Overloading
* 메서드 이름은 동일하지만 파라미터의 개수 또는 자료형이 다름
```java
class OverloadingTest{
    void cat(){
    }

    void cat(int a, int b){
    }
    
    void cat(String c){
    }
}
```
## Overriding
* 상위 클래스에서 정의한 메서드를 하위 클래스에서 재정의하는 것
```java
class Woman{ //부모클래스
    public String name;
    public int age;
    
    //info 메서드
    public void info(){
        System.out.println("여자의 이름은 "+name+", 나이는 "+age+"살입니다.");
    }
    
}
 
class Job extends Woman{ //Woman클래스(부모클래스)를 상속받음
 
    String job;
    
    public void info() { //부모(Woman)클래스에 있는 info()메서드를 재정의
        super.info();
        System.out.println("여자의 직업은 "+job+"입니다.");
    }
}

출처: https://private.tistory.com/25 [공부해서 남 주자]
```
