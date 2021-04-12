// args를 길게 넣는 것 보단
function saveSettings(followAlert, unfollowAlert, mrkAlert, themeColor) {
}

// 1. Function Destructuring 이용
function saveSettings(settings) {
    console.log(settings);
}

saveSettings({
    follow: true,
    alert: true,
    mkt: true,
    color: "green"
});

// 2. mkt을 중단했을 경우
function saveSettings(settings) {
    if (!settings.mkt) {

    }
    saveColor(settings.color);
}

saveSettings({
    follow: true,
    alert: true,
    mkt: false,
    color: "green"
});

// 위에 보단 이렇게 설정하자!
function saveSettings({ follow, alert, color = "blue" }) {
    console.log(color);
}

saveSettings({
    notification: {
        follow: true,
        alert: true,
        mkt: false
    },
    color: {
        theme: "green"
    }
});

function saveSettings({ notification, color: { theme } }) {
    console.log(color);
}