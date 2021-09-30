const weakSet = new WeakSet();

// garbage collector가 작동함
// object를 가르키는 pointer가 없다면 object는 garbage collector가 가져감
const sexy = {
    im: true
};

weakSet.add(sexy);
weakSet.add({ hello: true }); // 사라짐!
