const user = {
    age: 12,
    name: jiyu
};

user.oneMore = true;
user.name = null;

// Set: 중복된 값 저장 X
const sexySet = new Set([1, 2, 3, 4, 5, 6, 7, 7, 7, 7, 8]);
sexySet.has(9); //false
sexySet.delete(1);
sexySet.clear(); //set의 값 모두 지우기
sexySet.size(); //8
