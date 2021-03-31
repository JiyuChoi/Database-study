// 1. 특정 문자열이 포함된 배열 만들어 반환하기
function print() {
    const array = document.querySelectorAll("li");
    const newArray = Array.from(array); // li로 노드로 구성된 Array
    const res = newArray.filter(function (value) {
        return value.innerText.includes("e")
    })
    return res;
}

console.log(print());

// 2. 로또 번호 생성기
const SETTING = {
    name: "LUCKY LOTTO!",
    count: 6,
    maxNumber: 45
}

const { count, maxNumber } = SETTING;
let lottoSet = new Set();

function getRandomNumber(maxNumber) {
    const setNumber = Math.floor(Math.random() * (maxNumber) + 1);
    while (!lottoSet.has(setNumber)) {
        lottoSet.add(setNumber);
    }
}

for (let i = 0; i < maxNumber; i++) {
    getRandomNumber(maxNumber);
}

console.log(lottoSet.values());
