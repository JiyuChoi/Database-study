// Rest: 모든 값을 하나의 변수로 contract(축소)
// array 형태로 반환 
const infiniteArgs = (...potato) => console.log(potato); // 변수명은 자유롭게! 

infiniteArgs("1", 2, true, "lalala", [1, 2, 3, 4]);

// Example
cosnt bestFriendMaker = (firstOne, ...rest) => {
    console.log(`My best friend is ${firstOne}`)
    console.log(rest); // array 형태로 반환
};

bestFriendMaker("jiyu", "lynn", "dal", "mark");
