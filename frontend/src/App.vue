<template>
  <div id="app">
    <nav-bar :key="componentKey"></nav-bar>
    <b-container>
      <router-view :navbarRefresh="forceRerender"></router-view>
    </b-container>
  </div>
</template>

<script>
import NavBar from "./components/NavBar";

export default {
  name: "App",
  components: { NavBar },
  data() {
    return {
      componentKey: 0,
    };
  },
  methods: {
    forceRerender() {
      this.componentKey += 1;
    }
  }
};
</script>

<style>
</style>
