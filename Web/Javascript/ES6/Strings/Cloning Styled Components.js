// const styled = (css) => console.log(css);

// styled("h1")`border-radius:10px;
// color:blue;`;

// const styled = (aElement) => {
//     const el = document.createElement(aElement);
//     return el;
// }

// const title = styled("div");
// console.log(title);


// h1을 호출하게 되는 오류 
// 문제해결 방법 
const styled = (aElement) => {
    const el = document.createElement(aElement);
    return args => {
        const styles = args[0];
        el.style = styles;
        return el;
    }
}

const title = styled("h1")`
    border-radius:10px;
    color:blue;`;

console.log(title);

const subtitle = styled("span")`
    color:green`;

title.innerText = "We just cloned";
subtitle.innerText = "Styled Component";

document.body.append(title, subtitle)