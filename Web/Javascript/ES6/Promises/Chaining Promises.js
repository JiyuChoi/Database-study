const amISexy = new Promise((resolve, reject) => {
    resolve(2);
});

amISexy.then(number => console.log(number)); // 2

// Promise Chaining
amISexy
  .then(number => {
    console.log(number*2);
    return number*2; // then을 엮을 때는 return 값이 있어야 함
  })
  .then(otherNumber => {
    console.log(otherNumber*2);
  });


// function으로 만들기
const timesTwo = (number) => number *2;

amISexy
  .then(timesTwo)
  .then(timesTwo)
  .then(timesTwo)
  .then(timesTwo)
  .then(timesTwo)
  .then(() => {
    throw Error("Something is wrong");
  })
  .then(lastNumber => console.log(lastNumber))
  .catch(error => console.log(error));
