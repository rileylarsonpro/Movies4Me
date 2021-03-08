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
          <p>{{ movie.releasedate.substring(0, 4) }}</p>
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
        <b-col>
          <h3>Reviews</h3>
          <b-container c v-for="review in movieReviews" :key="review.reviewid">
              <div><b>{{ review.username }}- {{ review.rating }}/5</b></div>
            <div>{{ review.datewritten }}</div>
              <div><em>{{ review.reviewtext }}</em></div>
              <br>
          </b-container>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <div v-for="tag in movieTags" :key="tag.tagid">
            {{ tag.categoryname }}: {{ tag.tagname }}
          </div>
          <br>
          <div v-if="movieServices != []">
            <b>Streaming on:</b>
            <div v-for="service in movieServices" :key="service.platformregionid">
            {{ service.regionname }} {{ service.platformname }}
          </div>
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
      reviewText: "",
      movieTags: [],
      movieReviews: [],
      movieServices: [],
    };
  },
  created: function () {
    this.loading = true;
    Api.getMovieDetail(this.$route.params.id).then((res) => {
      this.movie = res.data[0];
      this.loading = false;
      Api.getMovieTags(this.movie.movieid).then((res) => {
        this.movieTags = res.data;
      });
      Api.getReviews(this.movie.movieid).then((res) => {
        this.movieReviews = res.data;
      });
      Api.getServicesForMovie(this.movie.movieid).then((res) => {
        this.movieServices = res.data;
      });
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
      this.message="Your review has been sent to admin for approval";

    },
  },
};
</script>