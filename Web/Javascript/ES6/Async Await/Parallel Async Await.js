const getMoviesAsync = async () => {
    try {
        const [moviesResponse, suggestionsResponse] = await Promise.all([
            fetch("https://yts.mx/api/v2/list_movies.json"),
            fetch("https://yts.mx/api/v2/movie_suggestions.json?movie_id=100"),
        ]);
        const [movies, suggestions] = await Promise.all([
            moviesResponse.json(),
            suggestionsResponse.json(),
        ]);
        console.log(movies, suggestions);
    } catch (e) {
        console.log(e);
    } finally {
        console.log("we are done");
    }
};

getMoviesAsync();