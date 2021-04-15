const friends = ["jiyu", "lynn", "dal", "mark"];

// for Loop
for (let i = 0; i < friends.length; i++) {
    console.log(`${i} I love you`);
    console.log(friends[i]);
}

// forEach: value, index, array를 인자로 받을 수 있음
const addHeart = (v, i, a) => console.log(v, i, a);
friends.forEach(addHeart);

// for ... of 
// 1. const, let 선택해서 선언 가능!
for (const friend of friends) {
    console.log(friend);
}

// 2. String, Array 등에서 사용 가능! (forEach는 Array만)
for (const letter of "It's too long~") {
    console.log(letter);
}

// 3. Break 가능!
const friends2 = ["jiyu", "lynn", "dal", "mark", "pipe", "theo"];

// Ex) Mark를 찾는 순간 루프 중지
for (const friend of friends2) {
    if (friend === "mark") {
        break;
    }
    else {
        console.log(friend);
    }
}
