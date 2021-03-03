<template>
  <div>
    <b-breadcrumb>
      <b-breadcrumb-item to="/admin"> Admin </b-breadcrumb-item>
      <b-breadcrumb-item active>Add Movie</b-breadcrumb-item>
    </b-breadcrumb>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label >Movie Title</label>
            <input
              v-model="title"
              type="text"
              class="form-control"
              name="title"
            />
          </div>
          <div class="form-group">
            <label >Movie Release Date</label>
            <input
              v-model="releasedate"
              type="date"
              class="form-control"
              name="releasedate"
            />
          </div>
          <div class="form-group">
            <label>Movie Poster URL</label>
            <input
              v-model="posterURL"
              type="text"
              class="form-control"
              name="posterURL"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Add Movie</span>
            </button>
          </div>
        </div>
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
  name: "AdminMovieAdd",
  data() {
    return {
      title: "",
      releasedate: "",
      posterURL: "",
      loading: false,
      message: "",
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addMovie({ movietitle: this.title, releasedate: this.releasedate.toString() , movieposterurl: this.posterURL})
        .then(() => {
          this.loading = false;
          this.$router.push("/admin/");
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
  },
};
</script>