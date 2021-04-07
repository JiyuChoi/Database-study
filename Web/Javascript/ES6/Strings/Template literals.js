// template literals 
const sayHi = (aName = "anon") => `hello ${aName} lovely to have you`;
console.log(sayHi());

// 표현식도 넣을 수 있음! (+,-,/) 
console.log(`hello how are you ${1000 * 1800}`)

// Function도 가능
const add = (a, b) => a + b;
console.log(`a + b = ${add(6, 6)}`);
