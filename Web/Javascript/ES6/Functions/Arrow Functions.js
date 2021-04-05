// 기존에 사용하던 함수 방식
const hello = function nameOf(arg){
};

// Arrow Function Example
const names = ['jiyu', 'lynn', 'teddy'];

// const hearts = names.map(function(item){
//   return item + "❤️";
// });
// console.log(hearts);

const hearts = names.map((item, index) => item + "❤️" + index);
console.log(hearts);
