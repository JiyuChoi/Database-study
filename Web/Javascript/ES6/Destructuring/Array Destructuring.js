// Array 데이터를 조작할 필요가 없을 때 사용하면 좋다!
// API로부터 응답받은 데이터를 array 형태로 만들어야 할 때  

const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

// 1. Array 값 가져오기
// array index 이용 
const mon = days[0];
const tue = days[1];
const wed = days[2];

console.log(mon, tue, wed);

// array destructuring 이용
const [mon, tue, wed] = days;

console.log(mon, tue, wed);

// function도 가능!
const days2 = () => ["Mon", "Tue", "Wed"];
const [mon, tue, wed, thu = "Thu"] = days();

console.log(mon, tue, wed, thu);