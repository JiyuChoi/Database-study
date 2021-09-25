class User {
    constructor({ username, lastName, email, password }) {
        this.username = username;
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

const sexyUser = new User({
    username: "Jiyu",
    lastName: "Choi",
    email: "jiyu@gmail.com",
    password: "1234"
});

class Admin extends User {
    constructor({ username, lastName, email, password, superAdmin, isActive }) {
        super({ username, lastName, email, password }); // super: 원시 클래스 호출 (User)
        this.superAdmin = superAdmin;
        this.isActive = isActive;
    }
    deleteWebsite() {
        console.log("Deleting the whole website...");
    }
}

const admin = new Admin({
    username: "Jiyu",
    lastName: "Choi",
    email: "jiyu@gmail.com",
    password: "1234",
    superAdmin: true,
    isActive: true
});

console.log(admin.email)