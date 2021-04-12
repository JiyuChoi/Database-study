// settings 데이터를 API로부터 받았다고 가정
const settings = {
    color: {
        chosen_color: "dark"
    }
};

const {
    color: { chosen_color = "light" }
} = settings;

console.log(chosen_color);


// Renaming
// 방법 1)
const chosenColor = settings.color.chosen_color || "light";

// 방법 2) Destructuring
const {
    color: { chosen_color: chosenColor = "light" }
} = settings;


// 변수를 바꾸고 싶다면 (let chosenColor Update)
let chosenColor = "blue";

({
    color: { chosen_color: chosenColor = "light" }
} = settings);

