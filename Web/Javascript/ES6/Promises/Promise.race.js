// Promise.race
// 3개 중 하나라도 resolve or reject가 되면 됨 (가장 빠른 것이 결과 값을 결정!)
// 어느 것이 먼저 되는지 상관없을 때

const p1 = new Promise((resolve) => {
    setTimeout(resolve, 5000, "First");
});

const p2 = new Promise((resolve, reject) => {
    setTimeout(reject, 1000, "I hate JS");
});

const p3 = new Promise((resolve) => {
    setTimeout(resolve, 3000, "Third");
});


const motherPromise = Promis.race([p1, p2, p3]); // 전부 끝났을 때 순서대로 값을 제공

motherPromise
    .then(values => console.log(values))
    .catch(err => console.log(err)); // p2: I hate JS 출력 (1초)

    
// 아래와 같이 사용도 가능!
Promise.race([p1, p2, p3])
    .then(values => console.log(values))
    .catch(err => console.log(err));
