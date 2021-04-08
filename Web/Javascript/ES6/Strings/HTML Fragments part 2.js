const wrapper = document.querySelector(".wrapper");

const friends = ["me", "yann", "dal", "mark"];

const ul = document.createElement("ul");
friends.forEach(friend => {
    const li = document.createElement("li");
    li.innerText = friend;
    ul.append(li);
});

wrapper.append(ul);

// templat literals
const list = `
    <h1>People i love</h1>
    <ul>
        ${friends.map(friend => `<li>${friend}</li>`).join("")}
    </ul>
`;

wrapper.innerHTML = list;