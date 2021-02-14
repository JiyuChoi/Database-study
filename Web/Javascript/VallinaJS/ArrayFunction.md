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
* shift(): 배열의 첫 요소를 반환
```js
let study = ["html", "css"];
study.pop() //"html"
study //(1)["css"]
```

### 📌 splice()
* 원하는 위치의 요소를 삭제하거나 추가하는 함수
```js
let numbers = [0, 1, 2, 3, 4, 5];
// index 2인 요소부터 끝까지 삭제
numbers.splice(2)
//(4) [2, 3, 4, 5] 
numbers
//(2) [0, 1]

let study = ["html", "css", "web", "jquery"]
// index 2인 요소부터 1개 삭제
study.splice(2, 1)
//["web"]

// index 2인 요소부터 1개 삭제하고 "js" 삽입
study.splice(2, 1, "js")
//["jquery"]
study
//(3) ["html", "css", "js"]
```

### 📌 slice()
* 원하는 위치의 요소를 추출하는 함수
* 원래 배열은 변경되지 않음 
```js
let colors = ["red", "green", "blue", "white", "black"];
colors.slice(2)
// (3)["blue", "white", "black"]
colors
//(5) ["red", "green", "blue", "white", "black"] (원래 배열은 변경되지 않음)

let colors2 = colors.slice(1,4);
colors2
//(3) ["green", "blue", "white"]
colors
//(5) ["red", "green", "blue", "white", "black"] (원래 배열은 변경되지 않음)

```
