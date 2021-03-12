'use strict';

// JavaScript is synchronous. (코드가 하나하나씩 수행됨)
// Execute the code block in order after hoisting.
// hoisting: var, function declaration (선언이 제일 위로 올라가는 것)
console.log('1');
setTimeout(() => console.log('2'), 1000);
console.log('3');

// Synchronous callback (즉각적 수행)
function printImmediately(print) {
    print();
}
printImmediately(() => console.log('hello'));

// Asynchronous callback
function printWithDelay(print, timeout) {
    setTimeout(print, timeout);
}
printWithDelay(() => console.log('async callback'), 2000);

// Callback Hello Example
class UserStorage {
    loginUser(id, password, onSuccess, onError) {
        setTimeout(() => {
            if (
                (id === 'ellie' && password === 'dream') ||
                (id === 'coder' && password === 'academy')
            ) {
                onSuccess(id);
            } else {
                onError(new Error('not found'));
            }
        }, 2000);
    }

    getRoles(user, onSuccess, onError) {
        setTimeout(() => {
            if (user === 'ellie') {
                onSuccess({ name: 'ellie', role: 'admin' });
            } else {
                onError(new Error('not found'));
            }
        }, 1000);
    }
}

const UserStorage = new UserStorage();
const id = prompt('enter your id');
const password = prompt('enter your password');
UserStorage.loginUser(
    id,
    password,
    user => {
        UserStorage.getRoles(
            user,
            userWithRole => {
                alert(
                    `Hello ${userWithRole.name}, you have a ${userWithRole.role} role`
                );
            }, error => {
                console.log(error)
            }
        );
    }, error => {
        console.log(error)
    }
);
