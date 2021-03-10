<template>
  <router-link :to="`movie/${movie.movieid}`">
    <img class="border border-dark rounded" :src="movie.movieposterurl" />
  </router-link>
</template>

<script>
//import Api from "../api";

export default {
  name: "MoviePoster",
  props: {
      movie: Object,
  },
  data: function () {
    return {
      loading: false,
    };
  },
  created: function () {}
};
</script>