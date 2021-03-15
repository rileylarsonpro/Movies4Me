<template>
  <div>
    <div v-if="loading">Loading movies....</div>
    <container v-else>
      <h3>Movies Suggested For You:</h3>
      <span v-for="movie in suggestedMovies" :key="movie.movieid">
        <movie-poster  :movie="movie"></movie-poster>
      </span>
      <h3>Movies You Have Seen:</h3>
      <span v-for="movie in seenMovies" :key="movie.movieid">
        <movie-poster :movie="movie"></movie-poster>
      </span>
      <h3>All Movies:</h3>
      <span v-for="movie in movies" :key="movie.movieid">
        <movie-poster  :movie="movie"></movie-poster>
      </span>
    </container>
  </div>
</template>

<script>
import Api from "../api";
import MoviePoster from "../components/MoviePoster"
import { getUserIdFromToken } from "../auth";
import { getJwtToken } from "../auth";

export default {
  name: "Home",
  components: {
    MoviePoster
  },
  data: function () {
    return {
      loading: true,
      movies: [],
      seenMovies: [],
      suggestedMovies: [],
    };
  },
  created: function () {
    this.loading = true;
    Api.getSuggestedMovies(getUserIdFromToken(getJwtToken())).then((res) => {
      this.suggestedMovies = res.data;
      this.loading = false;
    });
    Api.getMovies().then((res) => {
      this.movies = res.data;
    });
    Api.getSeenMovies(getUserIdFromToken(getJwtToken())).then((res) => {
      this.seenMovies = res.data;
    });
    
  },
};
</script>