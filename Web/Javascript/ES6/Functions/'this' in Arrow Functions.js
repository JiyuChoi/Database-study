const button = document.querySelector("button");

// 1. this 예약어
button.addEventListener("click", function () {
    console.log(this);
    console.log("I have been clicked");
    this.style.backgroundColor = "red";
});


// 2. Arrow Function으로 표현 -> this 출력 
button.addEventListener("click", () => {
    console.log(this);
}); // this는 window를 가르키게 됨!


// * Arrow function은 this를 이벤트로 부터 가지고 있지 않음


// 3. Window object 출력
const handleCheck = () => {
    console.log(this);
}

button.addEventListener("click", handleCheck);


// 4. Object 
// const jiyu = {
//     name: "Jiyu",
//     age: 26,
//     addYear: () => {
//         this.age++;
//     }
// };

console.log(jiyu);
jiyu.addYear();
jiyu.addYear();
console.log(jiyu); //24

const jiyu = {
    name: "Jiyu",
    age: 26,
    addYear() {
        this.age++;
    }
};

console.log(jiyu);
jiyu.addYear();
jiyu.addYear();
console.log(jiyu); //26