<template>
  <div>
    <div v-if="loading">Loading movies....</div>
    <router-link to="/admin" tag="b-button" class="float-right"
      >Admin Movie</router-link
    >
    <br /><br />
    <b-table-simple hover small caption-top responsive>
      <b-thead>
        <b-tr>
          <b-th>Review ID</b-th>
          <b-th>Username</b-th>
          <b-th>Movie Title</b-th>
          <b-th>Review Text</b-th>
          <b-th>Actions</b-th>
        </b-tr>
      </b-thead>
      <b-tbody>
        <b-tr v-for="review in reviews" :key="review.reviewid">
          <b-td>{{ review.reviewid }}</b-td>
          <b-td>{{ review.username }}</b-td>
          <b-td>{{ review.movietitle }}</b-td>
          <b-td>{{ review.reviewtext }}</b-td>
          <b-td>
            <b-button-group>
              <b-button
                variant="outline-info"
                @click="() => publishReview(review.reviewid)"
                >Publish</b-button
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
  name: "AdminApproveReviews",
  data: function () {
    return {
      loading: false,
      reviews: [],
    };
  },
  created: function () {
    this.loadReviews();
  },

  methods: {
    loadReviews() {
      this.loading = true;
      this.reviews = [];
      Api.getNonAprovedReviews().then((res) => {
        this.reviews = res.data;
        this.loading = false;
      });
    },
    
    publishReview(reviewid) {
        console.log("here")
      Api.publishReview(reviewid)
        .then(() => {
          this.loadReviews();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>