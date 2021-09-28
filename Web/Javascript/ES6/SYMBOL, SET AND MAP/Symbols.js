const hello = Symbol("hello");
const bye = Symbol("hello");

// Uniqueness
const superBig = {
    [Symbol("jiyu")]: {
        age: 12
    },
    [Symbol("jiyu")]: {
        age: 12
    },
    hello: "bye"
};

// Privacy
Object.keys(superBig); // hello
Object.getOwnPropertySymbols(superBig);

const s = Object.getOwnPropertySymbols(superBig);
s.forEach(symbol => console.log(superBig[symbol]));
