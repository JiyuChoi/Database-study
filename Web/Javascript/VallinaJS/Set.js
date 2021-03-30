let mySet = new Set();
// console.log(toString.call(mySet));

// 1. Set: 중복없이 유일한 값을 저장하려고 할 때, 이미 존재하는지 체크할 때 유용!
mySet.add("crong");
mySet.add("harry");
mySet.add("crong");

console.log(mySet.has("crong"));

mySet.forEach(v => console.log(v));

mySet.delete("crong");

// 2. WeakSet: 참조를 가지고 있는 객체만 저장이 가능하다
// 객체형태를 중복없이 저장하려고 할 때 유용하다 
let arr = [1, 2, 3, 4];
let arr2 = [5, 6, 7, 8];
let obj = { arr, arr2 };
let ws = new WeakSet();

ws.add(arr);
ws.add(function () { });
ws.add(arr2);
ws.add(obj);

// 불가능한 자료형 
// ws.add(111);
// ws.add("111");
// ws.add(null);

console.log(ws);

arr = null;
console.log(ws.has(arr), ws.hae(arr2)); // true false