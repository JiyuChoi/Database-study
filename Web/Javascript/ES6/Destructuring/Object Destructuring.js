// Destructuring (비구조화)
// Object나 Array, 그 외의 요소들 안의 변수를 바깥으로 끄집어 내서 사용할 수 있도록 함

const settings = {
    notifications: {
        follow: true,
        alerts: true,
        unfollow: False
    },
    color: {
        theme: "dark"
    }
};

if (settings.notifications.follow) {
    // send email
}


// Take element (Destructing)
const { notifications: { follow }, color } = settings; // notifications에 담겨있는 follow 변수 생성, notifications는 변수가 아님! 
console.log(follow, color);

// const notifications = settings.notifications;
const { notifications } = settings;


// if not exist follow: set a default value
const { notifications: { follow = false }, color } = settings; // notifications에 담겨있는 follow 변수 생성

// if not exist notification object: set empty object
const { notifications: { follow = false } = {}, color } = settings; // notifications에 담겨있는 follow 변수 생성

// 변수를 가져올 경로 = 타겟 object
const {
    color: { theme = "light" }
} = settings;
console.log(theme);
