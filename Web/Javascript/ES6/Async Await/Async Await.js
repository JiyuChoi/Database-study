// asyn/await은 기본적으로 Promise를 사용하는 코드를 더 좋게 보이게 하는 문법
// then, catch 같은 것들은 구식!

// 1. then을 사용한 경우
const getMoviesPromise = () => {
    fetch("https://yts.mx/api/v2/list_movies.json")
        .then(response => {
            console.log(response)
            return resoponse.json()
        })
        .then(json => console.log(json))
        .catch(e => console.log(`${e}X`));
};

// 2. await를 사용한 경우
// await은 항상 async function 안에서만 사용할 수 있음
// await은 Promise가 끝나기를 기다림 (not success! resolve, reject 상관 없이!)

//asyn function getMovies()
const getMoviesAsync = async () => {
    const response = await fetch("https://yts.mx/api/v2/list_movies.json");
    const json = await response.json();
    console.log(response);
    console.log(json);
};

getMoviesAsync();
