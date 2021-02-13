## Array function

### 📌 concat()
* 둘 이상의 배열을 연결하는 함수
* 새로운 배열을 생성하기 때문에 기존의 배열에는 영향을 주지 않음
```js
let nums = ["1", "2", "3"];
let chars = ["a", "b", "c", "d"];
nums.concat(chars); //(7)["1", "2", "3", "a", "b", "c", "d"]
```

### 📌 join()
* 배열 요소를 연결하는 함수
```js
nums.join();
"1,2,3"
nums.join("-");
"1-2-3"
```

### 📌 push(), unshift()
* push(): 배열의 맨 끝에 요소 추가
```js
let nums = ["1", "2", "3"];
nums.push("4", "5");
5 // 새 요소가 추가된 후의 배열 요소의 개수가 반환됨
nums //(5)["1", "2", "3", "4", "5"]
```
* unshift(): 배열의 맨 앞에 요소 추가
```js
let nums = ["1", "2", "3"];
nums.unshift("0");
6 // 새 요소가 추가된 후의 배열 요소의 개수가 반환됨
nums //(6)["0", "1", "2", "3", "4", "5"]
```

### 📌 pop(), shift()
* pop(): 맨 뒤에 있는 요소를 추출
```js
let study = ["html", "css", "javascript"];
study.pop() //"javascript"
study //(2)["html", "css"]
```
* shift(): 배열의 첫 요소르 반환
```js
let study = ["html", "css"];
study.pop() //"html"
study //(1)["css"]
```
