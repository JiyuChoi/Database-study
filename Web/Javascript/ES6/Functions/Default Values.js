function sayHi(aName) {
    return "Hello " + aName;
}
console.log(sayHi("jiyu"));

console.log(sayHi()); // Hello undefinded

// aName 값이 없으면 anon 출력 
function sayHi(aName) {
    return "Hello " + (aName || "anon");
}

// Default Values
function sayHi(aName = "anon") {
    return "Hello " + aName;
}

// Arrow Function
const sayHi = (aName = "anon") => "hello " + aName;

const DEFAULT = "lalala";
const sayHi = (aName = DEFAULT) => "hello " + aName;