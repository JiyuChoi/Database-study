// Class (=blueprint)
class User {
    constructor() {
        this.username = "Jiyu";
    }
    sayHello() {
        console.log("Hello, I'm Jiyu");
    }
}
console.log(User.username); //undefined


// Class를 사용하려면 instance를 만들어줘야함
const sexyUser = new User(); //sexyUser는 instance

console.log(sexyUser.username); //Jiyu

setTimeout(sexyUser.sayHello, 4000);

const uglyUser = new User();
sexyUser.sayHello();
uglyUser.sayHello();


// Object에서도 가능
const baseObject = {
    username: "Jiyu",
    sayHello: function () {
        console.log("Hello, I'm Jiyu");
    }
}
const sexyUser = baseObject;
sexyUser.sayHello();


// argument 이용!
class User {
    constructor(name) {
        this.username = name;
    }
    sayHello() {
        console.log(`Hello, I'm ${this.username}`);
    }
}

const sexyUser = new User("Jiyu");

console.log(sexyUser.username); //Jiyu

sexyUser.sayHello(); //Hello, I'm Jiyu
