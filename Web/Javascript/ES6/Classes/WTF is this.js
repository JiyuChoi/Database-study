class Counter {
    constructor({ initialNumber = 0, counterId, plusId, minusId }) {
        this.count = initialNumber;
        this.counter = document.getElementById(counterId);
        this.counter.innerText = initialNumber;
        this.plusBtn = document.getElementById(plusId);
        this.minusBtn = document.getElementById(minusId);
        this.addEventListeners();
    }
    addEventListeners() {
        // eventListener를 target에 add할 때 event의 handeler는 this를 event target에 가르키게 함 
        // arrow function을 사용하면 this가 class 전체를 가르키게 됨
        this.plusBtn.addEventListener("click", this.increase);
        this.minusBtn.addEventListener("click", this.decrease);
    }
    increase = () => {
        this.count = this.count + 1;
        this.repaintCount();
    }
    decrease = () => {
        this.count = this.count - 1;
        this.repaintCount();
    }
    repaintCount() {
        this.counter.innerText = this.count
    }
}

// Class를 이용하면 원하는 만큼 카운터를 만들 수 있음!
new Counter({ counterId: "count", plusId: "add", minusId: "minus" });
new Counter({ counterId: "count2", plusId: "add2", minusId: "minus2", initialNumber: 111 });

