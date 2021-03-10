<template>
  <div>
    <b-breadcrumb>
      <b-breadcrumb-item to="/admin"> Admin </b-breadcrumb-item>
      <b-breadcrumb-item active>Edit Movie</b-breadcrumb-item>
    </b-breadcrumb>
    <div v-if="loading">Loading movie...</div>
    <div v-else class="card card-container p-4">
      <form name="form" @submit.prevent="handleSave">
        <div>
          <div class="form-group">
            <label for="username">Movie Id</label>
            <input
              v-model="movie.movieid"
              type="int"
              class="form-control"
              name="movieid"
              readonly
            />
          </div>
          <div class="form-group">
            <label for="username">Title</label>
            <input
              v-model="movie.movietitle"
              type="text"
              class="form-control"
              name="movietitle"
            />
          </div>
          <div class="form-group">
            <label>Release Date</label>
            <input
              v-model="movie.releasedate"
              class="form-control"
              name="releasedate"
            />
          </div>
          <div class="form-group">
            <label>Movie Poster URL</label>
            <input
              v-model="movie.movieposterurl"
              class="form-control"
              name="movieposterurl"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="saving">
              <span
                v-show="saving"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Save</span>
            </button>
          </div>
        </div>
      </form>
      <br>
      <form @submit.prevent="handleAdd">
        Add New Tag to Movie:
        <div class="form-group">
          <select v-model="selectedTag" required>
            <option disabled value="">Please select one</option>
            <option v-for="tag in tags.filter(tag =>!(movieTags.find(movieTag => movieTag.tagid === tag.tagid)))" :key="tag.tagid">
              {{ tag.tagname }}
            </option>
          </select>
        </div>
       <button class="btn btn-primary" type="submit">Add Tag to Movie</button>
      </form>
      <div v-if="message" class="alert alert-danger">
        {{ message }}
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";

export default {
  name: "AdminMovieEdit",
  data: function () {
    return {
      loading: false,
      saving: false,
      movie: null,
      movieTags: [],
      tags: [],
      selectedTag: null,
    };
  },
  methods: {
    loadMovieDetail() {
      this.loading = true;
      Api.getMovieDetail(this.$route.params.id).then((res) => {
        this.movie = res.data[0];
        this.loading = false;
        Api.getMovieTags(this.movie.movieid).then((res) => {
          this.movieTags = res.data;
        });
        Api.getTags().then((res) => {
          this.tags = res.data;
        });
      });
    },
    handleSave() {
      this.saving = true;
      Api.updateMovie(this.movie)
        .then(() => {
          this.saving = false;
          this.$router.push("/admin");
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleAdd() {
      let tagid = this.tags.find(tag => tag.tagname === this.selectedTag).tagid;
      Api.addTagToMovie(this.movie.movieid, tagid).then( () => {
          this.loadMovieDetail();
        });
    }
  },
  created: function () {
    this.loadMovieDetail();
  },
};
</script>