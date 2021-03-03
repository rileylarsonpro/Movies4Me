<template>
  <div>
    <div v-if="loading">Loading movie....</div>
    <div v-else>
      <h1>{{ movie.movietitle }}</h1>
      <p>{{ movie.releasedate }}</p>
    </div>
  </div>
</template>

<script>
import Api from "../api";

export default {
  name: "MovieDetail",
  data: function () {
    return {
      loading: false,
      movie: null,
    };
  },
  created: function () {
    this.loading = true;
    Api.getMovieDetail(this.$route.params.id).then((res) => {
      this.movie = res.data[0];
      this.loading = false;
    });
  },
};
</script>