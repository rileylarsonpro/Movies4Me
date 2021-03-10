<template>
  <div>
    <div v-if="loading">Loading your stuff....</div>
    <b-container v-else>
      <b-row>
        <b-col>
          <h1>{{ user.username }}'s Stuff</h1>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <h4>Your Streaming Services :</h4>
          <container>
          <b-row
            class="border border-info rounded p-1"
            v-for="service in userServices"
            :key="service.platformregionid"
          >
          <b-col>
            {{ service.regionname }} {{ service.platformname }}
          </b-col>
          <b-col-sm>
            <b-button
              variant="outline-danger"
              @click="() => deleteService(service.platformregionid)"
              >Remove</b-button
            >
          </b-col-sm>
          </b-row>
          </container>
          <form @submit.prevent="handleServiceAdd">
            Add Another Service:
            <div class="form-group">
              <select v-model="selectedService" required>
                <option disabled value="">Please select one</option>
                <option
                  v-for="service in services.filter(
                    (service) =>
                      !userServices.find(
                        (userService) =>
                          userService.platformregionid ===
                          service.platformregionid
                      )
                  )"
                  :key="service.platformregionid"
                >
                  {{ `${service.regionname} ${service.platformname}` }}
                </option>
              </select>
            </div>
            <button class="btn btn-info" type="submit">Add Service</button>
          </form>
        </b-col>
        <b-col>

          <h4>Tags you like:</h4>
          <container>
          <b-row
            class="border border-primary rounded p-1"
            v-for="tag in userTags"
            :key="tag.tagid"
          >
          <b-col>
            {{ tag.tagname }}
          </b-col>
          <b-col-sm>
            <b-button
              variant="outline-danger"
              @click="() => deleteTag(tag.tagid)"
              >Remove</b-button
            >
          </b-col-sm>
          </b-row>
          </container>
          <form @submit.prevent="handleTagAdd">
            Add new Tag to likes:
            <div class="form-group">
              <select v-model="selectedTag" required>
                <option disabled value="">Please select one</option>
                <option
                  v-for="tag in tags.filter(
                    (tag) =>
                      !userTags.find((userTag) => userTag.tagid === tag.tagid)
                  )"
                  :key="tag.tagid"
                >
                  {{ tag.tagname }}
                </option>
              </select>
            </div>
            <button class="btn btn-primary" type="submit">Add Tag</button>
          </form>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import Api from "../api";
import { getUserIdFromToken } from "../auth";
import { getJwtToken } from "../auth";

export default {
  name: "MovieDetail",
  components: {},
  data: function () {
    return {
      loading: false,
      user: null,
      reviewText: "",
      userTags: [],
      tags: [],
      userReviews: [],
      userServices: [],
      services: [],
      selectedTag: null,
      selectedService: null,
    };
  },
  created: function () {
    this.loadUserDetail();
  },
  methods: {
    loadUserDetail() {
      this.loading = true;
      Api.getUser(getUserIdFromToken(getJwtToken())).then((res) => {
        this.user = res.data[0];
      });
      Api.getUserLikesTags(getUserIdFromToken(getJwtToken())).then((res) => {
        this.userTags = res.data;
        this.loading = false;
      });
      Api.getUserSubscriptions(getUserIdFromToken(getJwtToken())).then(
        (res) => {
          this.userServices = res.data;
          this.loading = false;
        }
      );
      Api.getTags().then((res) => {
        this.tags = res.data;
      });
      Api.getPlatformRegions().then((res) => {
        this.services = res.data;
      });
    },
    likeTags() {
      let userId = getUserIdFromToken(getJwtToken());
      this.movieTags.foreach((tag) => {
        Api.userlikesTag(userId, tag.tagid);
      });
    },
    handleTagAdd() {
      let tagid = this.tags.find((tag) => tag.tagname === this.selectedTag)
        .tagid;
      Api.userlikesTag(getUserIdFromToken(getJwtToken()), tagid).then(() => {
        this.loadUserDetail();
      });
       this.selectedTag = null;
    },
    handleServiceAdd() {
      let platformRegionId = this.services.find((service) =>`${service.regionname} ${service.platformname}` === this.selectedService).platformregionid;
      console.log("PlatformRegion", platformRegionId)
      Api.userHasService(
        getUserIdFromToken(getJwtToken()),
        platformRegionId
      ).then(() => {
        this.loadUserDetail();
      });
      this.selectedService = null;
    },
    deleteTag(tagid){
        Api.deleteUserTag( getUserIdFromToken(getJwtToken()), tagid).then(() => {
        this.loadUserDetail();
      });
    },
    deleteService(platformRegionId) {
      Api.deleteUserService( getUserIdFromToken(getJwtToken()), platformRegionId).then(() => {
        this.loadUserDetail();
      });
    },
  },
};
</script>