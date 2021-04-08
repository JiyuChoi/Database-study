const wrapper = document.querySelector(".wrapper");

// default 
const addWelcome = () => {
    const div = document.createElement("div");
    const h1 = document.createElement("h1");
    h1.innerText = "Hello";
    h1.className = "Title";
    div.append(h1);
    wrapper.append(div);
};

setTimeout(addWelcome, 2000);

// using templat literals 
const addWelcome = () => {
    const div = `
    <div class="hello">
        <h1 class="title>Hello</h1>
    </div>
    `;
    wrapper.innerHTML = div;
}

setTimeout(addWelcome, 2000);

// space 고려 됨
console.log(`



hello

`);