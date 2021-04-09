// const friends = ["jiyu", "lynn", "dal", "mark"];

// 1. Array.of
const friends = Array.of("jiyu", "lynn", "dal", "mark");
console.log(friends);

// 2. Array.from
const buttons = document.querySelectorAll("button");
// const buttons = document.getElementsByClassName("btn");

console.log(butoons) // NodeList -> Not Array (just array-like-object)

buttons.forEach(button => {
    button.from.addEventListener("click", () => console.log("I ve been clicked"));
});
