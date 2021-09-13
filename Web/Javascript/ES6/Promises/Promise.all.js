// Promise.all
// Promis.then.then.then 처럼 하지않고 Promise.all로 해결 가능!
const p1 = new Promise((resolve) => {
    setTimeout(resolve, 5000, "First");
});

const p2 = new Promise((resolve) => {
    setTimeout(resolve, 1000, "Second");
});

const p3 = new Promise((resolve) => {
    setTimeout(resolve, 3000, "Third");
});


const motherPromise = Promis.all([p1, p2, p3]); // 전부 끝났을 때 순서대로 값을 제공

motherPromise.then(values => console.log(values));


// Promise.all (reject가 하나라도 있는 경우, Promise.all도 reject 됨)
const p1 = new Promise((resolve) => {
    setTimeout(resolve, 5000, "First");
});

const p2 = new Promise((resolve, reject) => {
    setTimeout(reject, 1000, "I hate JS");
});

const p3 = new Promise((resolve) => {
    setTimeout(resolve, 3000, "Third");
});

const motherPromise = Promis.all([p1, p2, p3]);

motherPromise
    .then(values => console.log(values))
    .cath(err => console.log(err));
