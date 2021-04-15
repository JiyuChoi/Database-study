// What is Promise
const amIPretty = new Promise((resolve, reject) => { });
console.log(amIPretty); // pending

// resolve (ending Promise)
const amIPretty = new Promise((resolve, reject) => {
    setTimeout(resolve, 3000, "Yes you are!");
});

// const amIPretty = new Promise((resolve, reject) => {
//     setTimeout(() => {
//         resolve("Yes you are!");
//     }, 3000);
// });

console.log(amIPretty);

setInterval(console.log, 1000, amIPretty);