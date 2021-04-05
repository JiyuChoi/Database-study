# Variable

## 📌 let: 변수를 생성 및 초기화할 때 사용
```js
let a = 5;
let b = a; // 5
```
## 📌 const: 상수(constant)의 약자로 변수 값이 변하지 않음
```js
const a = 221;
a = 101; //error 발생
```
#### ✔️ 대문자 상수
* '하드 코딩한' 값의 별칭을 만들 때 사용, 최초 할당 이후에 값이 변경되지 않는 상수 
* 오타의 확률 감소, 코드가독성 증가
```js
const COLOR_RED = "#F00";
const pageLoadTime = /* 웹 페이지를 로드하는데 걸린 시간 */
```
#### 모든 것에 const를 사용하고 만약 variable 값을 overwrite 해야하는 상황이 일어난다면 let을 사용!

