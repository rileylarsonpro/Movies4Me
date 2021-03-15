<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="info">
      <b-navbar-brand :to="{ path: '/' }">Movies4Me</b-navbar-brand>
      <b-navbar-nav v-if="loggedIn">
        <b-nav-item-dropdown class="ml-auto" v-if="isAdmin">
          <!-- Using 'button-content' slot -->
          <template #button-content right> Admin </template>
          <b-dropdown-item :to="{ path: '/admin' }">Movie List</b-dropdown-item>
          <b-dropdown-item :to="{ path: '/admin/add' }"
            >Add Movie</b-dropdown-item
          >
          <b-dropdown-item :to="{ path: '/admin/reviews' }"
            >Approve Reviews</b-dropdown-item
          >
        </b-nav-item-dropdown>
      </b-navbar-nav>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item v-if="loggedIn" :to="{ path: '/myStuff' }"
            >My Stuff</b-nav-item
          >
        </b-navbar-nav>
        <b-navbar-nav>
          <b-nav-item v-if="!loggedIn" :to="{ path: '/login' }"
            >Login</b-nav-item
          >
        </b-navbar-nav>
        <b-navbar-nav>
          <b-nav-item v-if="!loggedIn" :to="{ path: '/register' }"
            >Register</b-nav-item
          >
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-navbar-nav>
            <b-nav-item v-if="loggedIn" @click="logout()"
              >Sign Out</b-nav-item
            >
          </b-navbar-nav>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<script>
import Api from "../api";
import { getUserIdFromToken } from "../auth";
import { getJwtToken } from "../auth";

export default {
  name: "NavBar",
  components: {},
  data: function () {
    return {
      user: {},
      isAdmin: false,
    };
  },
  mounted: function () {
    this.getUserData();
  },
  methods: {
    getUserData() {
      Api.getUser(getUserIdFromToken(getJwtToken())).then((res) => {
        this.user = res.data[0];
        if (this.user.moderatorstatus) {
          this.isAdmin = true;
        }
      });
    },
    logout() {
      console.log("hello");
      this.$router.push("/logout");
      this.loggedin = false;
    },
  },
   computed: {
    loggedIn: function () {
      const token = getJwtToken();
      return !(token === undefined || token === "undefined" || token === null);
    }
  }
};
</script>


<style scoped>
</style>