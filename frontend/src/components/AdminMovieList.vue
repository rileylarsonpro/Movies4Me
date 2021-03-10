<template>
  <div>
    <div v-if="loading">Loading movies....</div>
    <router-link to="admin/add" tag="b-button" class="float-right"
      >Add movie</router-link
    >
    <router-link to="admin/reviews" tag="b-button" class="float-right"
      >Approve Reviews</router-link
    >
    <br /><br />
    <b-table-simple hover small caption-top responsive>
      <b-thead>
        <b-tr>
          <b-th>ID</b-th>
          <b-th>Title</b-th>
          <b-th>Release Date</b-th>
          <b-th>Actions</b-th>
        </b-tr>
      </b-thead>
      <b-tbody>
        <b-tr v-for="movie in movies" :key="movie.movieid">
          <b-td>{{ movie.movieid }}</b-td>
          <b-td>{{ movie.movietitle }}</b-td>
          <b-td>{{ movie.releasedate }}</b-td>
          <b-td>
            <b-button-group>
              <b-button
                variant="outline-primary"
                :to="`/admin/edit/${movie.movieid}`"
                >Edit</b-button
              >
              <b-button
                variant="outline-danger"
                @click="() => deleteMovie(movie.movieid)"
                >Delete</b-button
              >
            </b-button-group>
          </b-td>
        </b-tr>
      </b-tbody>
    </b-table-simple>
  </div>
</template>

<script>
import Api from "../api";

export default {
  name: "AdminMovieList",
  data: function () {
    return {
      loading: false,
      movies: [],
    };
  },
  created: function () {
    this.loadMovies();
  },

  methods: {
    loadMovies() {
      this.loading = true;
      this.movies = [];
      Api.getMovies().then((res) => {
        this.movies = res.data;
        this.loading = false;
      });
    },
    deleteMovie(movieid) {
      Api.deleteMovie(movieid)
        .then(() => {
          this.loadMovies();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>