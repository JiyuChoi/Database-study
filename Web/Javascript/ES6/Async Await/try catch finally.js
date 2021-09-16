// try, catch

const getMoviesAsync = async () => {
    try {
        const response = await fetch("https://yts.mx/api/v2/listmovies.json");
        const json = await response.json();
        console.log(response);
        console.log(json);
        throw Error("I'm hungry");
    } catch (e) {
        console.log(`${e} X`); // 모든 error를 잡아냄! (I'm hungry 까지도!)
    } finally {
        console.log("We are done!");
    }
};

getMoviesAsync();