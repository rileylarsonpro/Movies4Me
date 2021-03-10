<template>
  <div>
    <div v-if="loading">Loading your stuff....</div>
    <b-container v-else>
      <b-row>
        <b-col>
          <h1>{{ user.username }}'s Stuff</h1>
        </b-col>
      </b-row>
        <h4>Tags you like:</h4>
        <div v-for="tag in userTags" :key="tag.tagid">
            {{ tag.tagname }}
        </div>
    </b-container>
  </div>
</template>

<script>
import Api from "../api";
import { getUserIdFromToken } from "../auth";
import { getJwtToken } from "../auth";

export default {
  name: "MovieDetail",
  components: {
  },
  data: function () {
    return {
      loading: false,
      user: null,
      rating: 0,
      reviewText: "",
      userTags: [],
      userReviews: [],
      userServices: [],
    };
  },
  created: function () {
    this.loading = true;
    Api.getUser(getUserIdFromToken(getJwtToken())).then((res) => {
      this.user = res.data[0];
    });
    Api.getUserLikesTags(getUserIdFromToken(getJwtToken())).then((res) => {
      this.userTags = res.data;
      this.loading = false;
    });

  },
  methods: {
    likeTags() {
      let userId = getUserIdFromToken(getJwtToken())
      this.movieTags.foreach( tag => {
        Api.userlikesTag(userId, tag.tagid);
      })
    }
  },
};
</script>