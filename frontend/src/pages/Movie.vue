<template>
  <div>
    <div v-if="loading">Loading movie....</div>
    <b-container v-else>
      <b-row>
        <b-col>
          <h1>{{ movie.movietitle }}</h1>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <p>{{ movie.releasedate }}</p>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <img :src="movie.movieposterurl" />
        </b-col>
        <b-col>
          <form name="form" @submit.prevent="handleAdd">
            <div>
              <star-rating @rating-selected="setRating"></star-rating>
              <div class="form-group">
                <label>Review:</label>
                <textarea
                  v-model="reviewText"
                  type="text"
                  class="form-control"
                  name="reviewText"
                />
              </div>
              <div class="form-group">
                <button class="btn btn-primary btn-block" :disabled="loading">
                  <span
                    v-show="loading"
                    class="spinner-border spinner-border-sm"
                  ></span>
                  <span>Add Review and Rating</span>
                </button>
              </div>
            </div>
          </form>
          <div v-if="message" class="alert alert-danger">
            {{ message }}
          </div>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import Api from "../api";
import StarRating from "vue-star-rating";

export default {
  name: "MovieDetail",
  components: {
    StarRating,
  },
  data: function () {
    return {
      loading: false,
      movie: null,
      rating: 0,
      reviewText: ""
    };
  },
  created: function () {
    this.loading = true;
    Api.getMovieDetail(this.$route.params.id).then((res) => {
      this.movie = res.data[0];
      this.loading = false;
    });
  },
  methods: {
    setRating(rating) {
      console.log("rating", rating);
      this.rating = rating;
    },
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addReview({ 
        reviewtext: this.reviewText,
        rating: this.rating,
        movieid: this.movie.movieid,
      })
        .then(() => {
          this.loading = false;
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
      console.log("rating:", this.rating);
    },
  },
};
</script>