<template>
  <div>
    <b-jumbotron>
      <p>Welcome to Movies 4 Me!</p>
    </b-jumbotron>
    <br />
    <div v-if="loading">Loading movies....</div>
    <ul v-else>
      <li v-for="movie in movies" :key="movie.movieid">
        <router-link :to="`movie/${movie.movieid}`">{{
          movie.movietitle
        }}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import Api from "../api";

export default {
  name: "Home",
  data: function () {
    return {
      loading: false,
      movies: [],
    };
  },
  created: function () {
    this.loading = true;
    Api.getMovies().then((res) => {
      this.movies = res.data;
      this.loading = false;
    });
  },
};
</script>