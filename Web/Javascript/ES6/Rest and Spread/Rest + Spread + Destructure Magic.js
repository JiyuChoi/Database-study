const user = {
    name: "jiyu",
    age: 24,
    password: 12345
};

user["password"] = null;
console.log(user);


// 1. Object를 지우거나 정리할 때 
const killPassword = ({ password, ...rest }) => rest;
const cleanUser = killPassword(user);
console.log(cleanUser);


// 2. 기본 값 설정
const setCountry = ({ country = "KR", ...rest }) => ({ country, ...rest });
console.log(setCountry(user));


// 3. Rename key value
const user1 = {
    NAME: "jiyu",
    age: 24,
    password: 12345
};

const rename = ({ NAME: name, ...rest }) => ({ name, ...rest });
console.log(rename(user));