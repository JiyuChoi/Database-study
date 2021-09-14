// fetch -> Promise return!
fetch("http://google.com")
    .then(response => console.log(response.text()))
    .then(text => console.log(text))
    .catch(e => console.log(`${e}X`));

fetch("https://yts.mx/api/v2/list_movies.json")
    .then(response => {
        console.log(response)
        return resoponse.json()
    })
    .then(json => console.log(json))
    .catch(e => console.log(`${e}X`));