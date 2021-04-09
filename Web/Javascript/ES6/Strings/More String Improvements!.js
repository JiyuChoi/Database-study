// 1. includes
const isEmal = (email) => email.includes("@");
console.log(isEmal("jiyu@naver.com"));

// 2. repeat
const CC_NUMBER = "6060";
const displayName = `${"*".repeat(10)}${CC_NUMBER}`;
console.log(displayName);

// 3. startsWith, endsWith
const myName = "Ms. Jiyu";
console.log(myName.startsWith("Ms"));
console.log(myName.endsWith("Jiyu"));

// endsWith 이메일 검사 -> .com 으로 끝나는지
// includes 이메일 검사 -> @가 들어가 있는지