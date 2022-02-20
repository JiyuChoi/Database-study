# Promise 와 Async/Await (보충)

## 비동기 처리의 예

```jsx
console.log('A');
setTimeout(function() { console.log('B'); }, 0 );
console.log('C');
// 위 코드는 어떻게 출력될까? A > C > B
```

```jsx
function sleep(callback) {
	setTimeout(function() { 
		callback();
	}, 1000);
}

sleep(function() {
	console.log('A');
	sleep(function() {
		console.log('B');
		sleep(function() {
			console.log('C');
		});
	});
});

// 순차적으로 실행하고 싶은 경우 A > B > C	
// 콜백 지옥
```

# Promise

`Promise` 는 자바스크립트 비동기 처리에 사용되는 object

## `Promise` 의 3가지 상태

- pending (대기)
- fulfilled (이행)
- rejected (실패)

비동기 처리가 완료되지 않았다면 `pending`, 완료되었으면 `fulfilled`, 실패하거나 오류가 발생했다면 `rejected` 상태를 갖는다.

## Promise 사용 예시

```jsx
const promise = new Promise(function(resolve, reject) {
	setTimeout(function() { 
		console.log('A');
		//resolve();
		reject();
	}, 1000);
});

// promise가 끝났을 때, 값을 돌려달라고 함!
promise
.then(function() {
	console.log('B');
})
.catch(function() {
	console.log('error');
});
```

```jsx
// Producer
const condition = true;
const promise = new Promise((resolve, reject) => {
	if (condition) {
		resolve('resolved');
	} else {
		reject('rejected');
	}
});

// Consumers (then, catch, finally)
promise
	.then((res) => {
	  console.log(res); //console.log
  })
	.catch((error) => {
		console.log(error);
	})
	.finally(() => {
		console.log("end!");
	});
```

```jsx
// Producer
const condition = true;
const promise = new Promise((resolve, reject) => {
	if (condition) {
		resolve('resolved');
	} else {
		reject('rejected');
	}
});

// Consumers (then, catch, finally)
promise
	.then((res) => {
	  console.log(res); //console.log
  })
	.catch((error) => {
		console.log(error);
	})
	.finally(() => {
		console.log("end!");
	});
```

`condition` 값에 따라 promise의 반환 값이 결정 됨. 값이 참이면 `resolve`를 호출, 아니면 `reject` 를 호출

`resolve` 반환 값에 대해서는 `then()` 을 통해 결과 값을 받을 수 있고, `reject` 반환 값에 대해서는 `catch()` 를 통해 반환 받는다.

`then()` 과 `catch()` 의 체이닝을 통해 비동기 로직의 성공 여부에 따른 분기 처리가 가능하다.

```jsx
// 예제 2
const promise = new Promise(function(resolve, reject) {
	setTimeout(function() { 
		const name = prompt("이름을 입력하세요.");
		resolve(name);
	}, 1000);
});

promise
	.then(function(name) {
	console.log(`안녕하세요. ${name}님!`);
});
```

```jsx
// 예제 3
const promise = new Promise(function(resolve, reject) {
	setTimeout(function() { 
		const num = parseInt(prompt("10미만의 숫자를 입력하세요."));
		if (num <= 10) resolve(num);
		else reject(`오류 :${num}은 10 이상입니다.`);
	}, 1000);
});

promise
	.then(function(num) {
		console.log(`${num}!`);
})
	.catch(function(error) {
		console.log(error);
});

// then의 두번째 인수로 표현 가능 
promise.then(
		function(num) {
			console.log(`${num}!`);
	},
		function(error) {
			console.log(error);
	}
);
```

```jsx
fetch("http://127.0.0.1:8080/")
	.then(response => {
	console.log(response.json()
	return response.json();
}) // reponse: promise를 return 하는 함수를 가짐
	.then(potato => console.log(potato))
	.catch(e => console.log(`X ${e}`));
```

# async / await

기존의 `callback` 과 `Promise` 의 단점을 해소하고자 만들어졌다.

`callback` 이나 `Promise` 의 경우에 단점은 꼬리에 꼬리를 무는 코드가 나올 수도 있다는 부분이다.
흔히들 콜백 지옥, then() 지옥이라고 부른다.

```jsx
const variable = await promise;
// promise의 반환 값을 받아 variable에 할당
```

`await` 를 통해 `Promise` 반환 값을 받아 올 수 있다.

## async / await 사용 예시

```jsx
// Producer
const condition = true;
const promise = new Promise((resolve, reject) => {
	if (condition) {
		resolve('resolved');
	} else {
		reject('rejected');
	}
});

// Consumers (then, catch, finally)
promise
	.then((res) => {
	  console.log(res); //console.log
  })
	.catch((error) => {
		console.log(error);
	})
	.finally(() => {
		console.log("end!");
	});
```

```jsx
(async () => {
  const condition = true;
  const promise = new Promise((resolve, reject) => {
    if (condition) {
      resolve('resolved');
    } else {
      reject('rejected');
    }
  });

  try {
    const result = await promise;
    console.log(result);
  } 
	catch (err) {
    console.error(err);
  }
})();
```

```jsx
const getMovies = async () => {
        const json = await (
            await fetch(
                `https://yts.mx/api/v2/list_movies.json?minimum_rating=8.8&sort_by=year`
            )
        ).json()  
    };
```

`Promise` 사용 코드를 async/await 를 사용하여 코드를 변경했다. (익명함수 패턴 사용)

`async` 함수 내의 `await` 를 통해 `Promise` 반환 값을 result 변수에 담아 콘솔에 출력

`async/await` 은 `Promise` 와는 다르게 에러를 핸들링 할 수 있는 기능이 없다.

따라서 `try-catch()` 문을 활용하여 에러를 핸들링 하여 주어야 한다.

## 차이점

- **에러 핸들링**
    - `Promise` 를 활용할 시에는 `.catch()` 문을 통해 에러 핸들링이 가능하지만, `async/await` 은 에러 핸들링 할 수 있는 기능이 없어 `try-catch()` 문을 활용해야 한다
- **코드 가독성**
    - `Promise`의 `.then()` 지옥의 가능성
    - 코드가 길어지면 길어질수록, `async/await` 를 활용한 코드가 가독성이 좋다.
    - `async/await` 은 비동기 코드가 동기 코드처럼 읽히게 해준다. 코드 흐름을 이해 하기 쉽다.
