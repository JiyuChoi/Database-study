// this: 클래스 전체를 가리킨다
class User {
    constructor(name, lastName, email, password) {
        this.username = name;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }
    sayHello() {
        console.log(`Hello, I'm ${this.username}`);
    }
    getProfile() {
        console.log(`${this.username} ${this.email} ${this.password}`);
    }
    updatePassword(newPassword, currentPassword) {
        if (currentPassword === this.password) {
            this.password = newPassword;
        } else {
            console.log("Can't change password.");
        }
    }
}

const sexyUser = new User("Jiyu", "Choi", "jiyu@gmail.com", "1234");

sexyUser.getProfile();
console.log(sexyUser.password); //1234

sexyUser.updatePassword("hello", "1234");
console.log(sexyUser.password); //hello


// Extending
class Admin extends User {
    constructor(superadmin) { // 생성자를 새로 선언하면 extend한 것들이 사라짐! 오류 발생!
        this.superadmin = superadmin;
    }
    deleteWebsite() {
        console.log("Deleting the whole website...");
    }
}

const sexyAdmin = new Admin("Jiyu", "Choi", "jiyu@gmail.com", "1234", true);

sexyAdmin.deleteWebsite();

console.log(sexyAdmin.email); //jiyu@gmail.com

