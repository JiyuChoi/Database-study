// Spread: 변수를 unpack하는 것
const friends = [1, 2, 3, 4];

console.log(friends); // [1,2,3,4]
console.log(...friends); // 1 2 3 4

// 두 array 값을 합쳐서 하나의 array로 만들기 
const family = ["a", "b", "c"];
console.log([...friends, ...family]);

// Object도 가능!
const user = {
    name: "jiyu",
    age: 24
};

const hello = {
    user: true,
    hello: "hello"
};

console.log({ ...user, ...hello });
