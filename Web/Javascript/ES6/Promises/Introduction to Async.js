// 비동기성, 동기성
// Async: 순차적으로 처리되는 것이 아닌 한꺼번에 실행됨(비동기성)

// ex) 웹 사이트에서 데이터 받아오기
const hello = fetch("http://google.com");

console.log("something"); // something 먼저 출력
console.log(hello); // 그다음 에러 msg 발생 (js의 비동기성)
