//1. Then (return Promise resolve)

// const amIPretty = new Promise((resolve, reject) => {
//     setTimeout(resolve, 3000, "Yes you are!");
// });

//amIPretty.then(value => console.log(value));

const amIPretty = new Promise((resolve, reject) => {
    resolve("Yes you are!");
});

// function으로 불러오기
const thenFn = value => console.log(value);

amIPretty.then(thenFn);

// 2.Catch (reject)
const amIPretty = new Promise((resolve, reject) => {
    setTimeout(reject, 3000, "You are ugly");
});

amIPretty
    .then(result => console.log(result)) //resolve
    .catch(error => console.log(error)); //reject
// 두개가 각기 나열돼있음 (순서대로 진행하는 것이 아님)
// then이 실행되면 catch 실행 X
// catch가 실행되면 then 실행 X
