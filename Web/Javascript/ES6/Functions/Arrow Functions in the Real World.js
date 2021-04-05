const emails = ["jiyu@naver.com", "loveu@google.com", "jiyu@gmail.com", "hello@no.com"];


// 1. Array.prototype.find()
const foundMail = emails.find(function (email) {
    return email.includes("@gmail.com");
});

const foundMail = emails.find(item => item.includes("@gmail.com"));
console.log(foundMail);


// 2. Array.prototype.filter()
const noGmail = emails.filter(item => !item.includes("@gmail.com"));
console.log(noGmail);


// 3. Array.prototype.forEach()
emails.forEach(email => {
    console.log(email.split("@")[0])
});


// 4. forEach() VS map()
const cleaned = [];
emails.forEach(email => {
    cleaned.push(emails.split("@")[0]);
});

const cleaned = emails.map(email => emails.split("@")[0]);
console.log(cleaned);


// 5. How to Return Object
// {} 앞에 ()를 붙여 obj임을 나타내자!
const userObj = emails.map((email, index) => ({
    username: emails.split("@")[0],
    points: index
}));

console.table(userObj);