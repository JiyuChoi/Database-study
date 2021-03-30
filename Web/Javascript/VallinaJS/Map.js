// map & WeakMap
// Array -> set, weakset
// Object -> map. weakmap

// 1. map은 key/value 구조

// let wm = new WeakMap();
let myfun = function () { };

// 이 함수가 얼마나 실행됐지를 알려고 할 때
wm.set(myfun, 0);
console.log(wm);

let count = 0;
for (let i = 0; i < 10; i++) {
    count = wm.get(myfun); // get value
    count++;
    wm.set(myfun, count);
}
console.log(wm);

myfun = null;
console.log(wm.get(myfun)); // undefined
console.log(wm.has(myfun));


// 2. WeakMap 활용
/*
function Area(height, width) {
    this.height = height;
    this.width = width;
}

Area.prototype.getArea = function () {
    return this.height * this.width;
}
*/

let myarea = new Area(10, 20);
console.log(myarea.getArea());
console.log(myarea.height()); // 결과값 나온다

// private 변수 만드는 법
const wm = new WeakMap();

function Area(height, width) {
    wm.set(this, { height, width });
}

Area.prototype.getArea = function () {
    const { height, width } = wm.get(this);
    return height * width;
}

console.log(myarea.height()); // 접근 불가능

myarea = null;
console.log(wm.has(myarea)) // false