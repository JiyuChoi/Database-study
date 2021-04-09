const friends = {
    "jiyu@gmail.com",
    "lynn@naver.com",
    "dal@hanmail.net",
    "flynn@gorea.com"
};

// 1. find: 값이 존재하는지, 존재하면 리턴 (찾은 것에 첫번째 것 리턴)
const target = friends.find(friend => friend.includes("@korea.com"));
console.log(target);

// 2. findIndex: element가 있는지
let target2 = friends.findIndex(friend => friend.includes("@gorea.com"));
console.log(target2);

// friends[target2] = "flynn@korea.com";
const username = friends[target].split("@")[0];
const email = "korea.com";

// console.log(`${username}@${email}`);

friends[target2] = `${username}@${email}`;
console.log(friends);

// 1.을 함수로 만들자
const check = () => friends.findIndex(friend => friend.includes("@korea.com"));
let target3 = check();
console.log(target3) //3

if (target3 !== -1) {
    const username = friends[target3].split("@")[0];
    const email = "korea.com";
    frineds[target3] = `${username}@${email}`;
}


// 3. fill // 지정한 index의 element 값을 바꿈
if (target3 !== -1) {
    friends.fill("*".repeat(5), target3);
    friends.fill("*".repeat(5), 1, 3); // 1~2까지의 값을 변경! 아무것도 입력안하면 전체변경!
    console.log(friends);
}

// 4. includes
console.log(friends.includes("jiyu@gmail.com")); // return True or False