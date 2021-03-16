// async & await
// clear style of using promise

// 1. async
async function fetchUser() { // async를 쓰면 promise로 자동적으로 바뀜
    // do network request in 10 secs...
    return 'ellie';
}

const user = fetchUser();
user.then(console.log);
console.log(user);

// 2. awiat 
function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function getApple() {
    await delay(2000);
    return '🍎';
}

async function getBanana() {
    await delay(1000);
    return '🍌';
}

async function pickFruits() { // 병렬적으로 1초만에 수행 가능 
    const applePromise = getApple();
    const bananaPromise = getBanana();
    const apple = await applePromise;
    const banana = await bananaPromise;
    return `${apple} + ${banana}`;
}

pickFruits().then(console.log);

// 3. useful Promise APIs
// 병렬적으로 수행하려면 all 이용!
function pickAllFruits() {
    return Promise.all([getApple().getBanana()]).then(fruits => fruits.join(' + '));
}
pickAllFruits.then(console.log);

// 배열의 프로미스 중 가장 먼저 값을 리턴하는 것만 전달!
funcion pickOnlyOne() {
    return Promise.race([getApple(), getBanana()]);
}
pickOnlyOne().then(console.log);