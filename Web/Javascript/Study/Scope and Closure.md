# 스코프와 클로저

## Scope란?

변수 접근 규칙에 따른 유효범위

- 변수는 어떠한 환경 내에서만 사용 가능하며, 프로그래밍 언어는 각각의 변수 접근 규칙을 가짐
- JavaScript는 함수가 선언되는(lexical) 동시에 자신만의 Scope를 가짐

```jsx
const f1 = fuction() {
		const a = 1; // 함수 스코프
		const b = 2;
		console.log(a + b); // 3
    return a + b
}

let a = 20; // a는 전역 변수
console.log(b); // error: b is not defined
// 함수 내에서 선언된 변수는 함수가 종료됨과 동시에 사라짐

f1()
```

- 스코프는 변수이름이 충돌하는 문제를 덜어주고, 자동으로 메모리를 관리 함

## Scope의 종류

- **전역 스코프와 지역 스코프**
    - 전역 스코프(Global Scope)
    스크립트 전체에서 참조되는 것을 의미, 어느 곳에서든 참조 가능
    - 지역 스코프(Local Scope)
    정의된 함수 내에서만 참조되는 것을 의미, 함수 밖에서는 참조되지 않음
    
- **자바스크립트의 유효 범위**
    - 전역 스코프
    - 함수 스코프 (지역 스코프)
    - 블록 스코프 (ES6에서 등장 let, const) (지역 스코프)
    
- **전역 스코프**
    
    스크립트 전체에서 참조되는 것을 의미, 어느 곳에서든 접근 가능
    
    타인과 협업, 라이브러리 사용시 충돌이 가능성 있음 → 변수명이나 함수명이 겹칠 우려
    전역 스코프에서 변수나 함수를 선언하는 것은 자제해야함
    
- **함수 스코프**
    
    함수 내부에서 정의된 변수와 매개변수는 함수 외부에서 접근할 수 없음
    
    함수 내부에서 정의된 함수라면 함수의 어느 부분에서도 접근할 수 있음
    

```jsx
const func = function() {
		let a = 1;
		let b = 2;
		
		const func2 = function() {
		let b = 5;
		let c = 6;
		a = a + b + c; // 1 + 5 + 6
		console.log(a) // 12
		}
		func2();
		console.log(a); // 12
}
func();
```

- func2에서 a라는 변수를 선언한 적이 없지만, func라는 부모함수 안에서 선언된 함수이기 때문에 부모 함수에서 선언된 변수를 참조 가능함 → **함수의 중첩**

## Scope Chain (함수의 중첩)

내부함수에서는 외부함수의 변수에 접근 가능하지만, 외부함수에서는 내부함수의 변수에 접근 불가능

![Untitled](%E1%84%89%E1%85%B3%E1%84%8F%E1%85%A9%E1%84%91%E1%85%B3%E1%84%8B%E1%85%AA%20%E1%84%8F%E1%85%B3%E1%86%AF%E1%84%85%E1%85%A9%E1%84%8C%E1%85%A5%2068215bd7fd9047b8939987545b573fc0/Untitled.png)

```jsx
var name = 'scope';
function outer() {
		console.log('외부함수', name);
		function inner() {
		    var friend = 'Chain';
				console.log('내부함수', name);
    }
		inner();
}
outer();
console.log(friend); // 어떻게 출력될까?
```

1. inner 함수는 name 변수를 찾기 위해 먼저 자기 자신의 스코프에서 찾음
2. 이에 해당하는 것이 없으면 한 단계 올라가 outer 스코프에서 변수를 찾음
3. outer스코프에도 없다면 다시 올라가 전역 스코프에서 찾음
    
    만약 전역 스코프에도 없다면 변수를 찾지 못했다는 에러 발생
    

📌 이처럼 스코프가 계층적으로 연결되있는 것을 **중첩 규칙** 혹은 **스코프 체인**이라고 부름

- **블록 스코프**
    
    중괄호 {...} 안에서만 접근이 가능함. 블록 내부에 정의된 변수는 블록 실행이 끝나면 해제됨
    
    ES6 이후, let 키워드를 쓰면 block scope 사용할 수 있음
    
    ```jsx
    if (true) {
    		var value = "hello";
    }
    console.log(value); // "hello"
    ```
    
    ```jsx
    if (true) {
    		let value = "world";
    }
    console.log(value); // undefined
    ```
    
    ```jsx
    if (true) {
    	var value = "hello";
    }
    console.log(value); // "hello"
    
    if (true) {
    	let value = "world"; // let, const는 중괄호 안에서만 유효 범위를 갖는다
    }
    console.log(value); // "hello"
    ```
    

**Q. 콘솔에 출력되는 결과는?**

```jsx
function foo() {
  x = 1;
  let y = 2;
}

foo();

console.log(x);
console.log(y);
```

## 암묵적 전역 (implied globals)

    명시적으로 변수 앞에 let을 붙여주지 않으면 암묵적 전역변수가 됨
    따라서 x는 1, y는 Reference Error 발생

    → 이를 방지하기 위해 **use strict** 사용

```jsx
function showAge() {
		age = 27;
		console.log(age);
}
showAge();
console.log(age);

// age === window.age
// 선언없이 변수를 할당하면, 전역변수가 되어 window 객체와 연결됨
```

## 정적 스코프 (lexical scoping)

함수 내에서 선언된 변수의 scope는 함수를 호출할 때가 아니라 **선언할 때 결정**

(함수를 호출하는 시점에 결정 → 동적 스코프)

```jsx
// 예제 1
var a = 1;
var func = function () {
		console.log(a);
}
var func2 = function () {
		var a = 2;
		func();
}
func2();
```

```jsx
// 예제 2
var a = 1;
var func2 = function () {
		var a = 2;
		var func = function () {
				console.log(a);				
		}
		func();
}
func2();
```

- 함수를 선언하는 순간, 함수 내부의 변수는 자기 스코프로부터 가장 가까운 곳 (상위 범위에서)에 있는 변수를 참조하게 됨
- 예제 1의 경우, func()의 부모 함수는 전역 객체인 window이기 때문에 1이 출력됨
- 예제 2의 경우, func()가 func2() 안에서 선언됐으므로 2가 출력됨

## 클로저 (Closer)

클로저는 함수가 선언된 환경의 (렉시컬) 스코프를 기억하여 함수가 스코프 밖에서 실행될 때에도 이 스코프에 접근할 수 있게 하는 기술

- **클로저 생성 조건**
1. 내부함수가 익명함수로 되어 외부함수의 반환값으로 사용된다.
2. 내부함수는 외부함수의 실행환경에서 실행된다.
3. 내부함수에서 사용되는 변수 x는 외부함수의 변수 스코프에 있다.

```jsx
function outer() {
  var name = `closure`;
  function inner() {
    console.log(name);
  }
  inner();
}
outer();
// console> closure
```

```jsx
var name = `Warning`;
function outer() {
  var name = `closure`;
  return function inner() {
    console.log(name);
  };
}

var callFunc = outer();
callFunc();
// console> closure

// callFunc: 클로저
```

callFunc 호출에 의해 name이라는 값이 console에 Warning이 아니라 closure가 출력 됨
즉, outer 함수의 context 에 속해있는 변수를 참조하는 것이다. 여기서 outer함수의 지역변수로 존재하는 name변수를 free variable(자유변수)라고 함

→ 외부함수 호출이 종료되더라도 외부 함수의 지역변수 및 변수 스코프 객체의 체인 관계를 유지할 수 있는 구조를 클로저라 함. 외부 함수에 의해 반환되는 내부 함수를 가리키는 말

### 클로저 활용

```jsx
// counter는 outer 함수
// changeCount는 inner함수
// 객체를 리턴하고 있고 객체 안에는 increase, decrease, show와 같은 inner함수들을 저장
const counter = function() {
  let count = 0;
  function changeCount(number) {
    count += number;
  }
  return {
    increase: function() {
      changeCount(1);
    },
    decrease: function() {
      changeCount(-1);
    },
    show: function() {
      alert(count);
    }
  }
};

// counter를 실행하면 outer함수 스코프를 기억하고 있는 클로저들이 담긴 객체를 반환
// counterClosure는 counter함수 내부에 정의된 count나 changeCount에 접근 가능

const counterClosure = counter(); 
counterClosure.increase(); // 
counterClosure.show(); // 1
counterClosure.decrease();
counterClosure.show(); // 0
```

내부함수는 외부함수의 변수에 접근 할 수 있는데, 외부함수의 실행이 끝나서 외부함수가 소멸된 이후에도 내부함수가 외부함수의 변수에 접근 할 수 있음

→ 이러한 매커니즘을 **클로저**라 함
