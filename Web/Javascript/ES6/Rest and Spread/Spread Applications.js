// 1. Adding
// 기존 array를 복사한 new array에 변수 추가 
const friends = ["jiyu", "lynn"];
const newFriends = [...friends, "dal"]; // 맨 앞에 추가해도 됨
console.log(newFriends);

// Object도 가능!
const jiyu = {
    username: "jiyu"
};

console.log({ ...jiyu, password: 123 });

// 2. Example!
const first = ["mon", "tue", "wed"];
const weekend = ["sat", "sun"];

const fullWeek = [...first, "thu", "fri", ...weekend];

console.log(fullWeek);


// 3. 조건부로 값을 넣는 법
const lastName = prompt("Last name?");
// const user = {
//     username: "jiyu",
//     age: 24,
//     lastName: lastName !== "" ? lastName : undefined
// }

const user = {
    username: "jiyu",
    age: 24,
    ...(lastName !== "" && { lastName }) // 공백이 아니고 값이 있어야 lastname 생성
}

console.log(typeof lastName);
console.log(user);