<template>
  <div id="app">
    <nav-bar></nav-bar>
    <b-container>
      <router-view></router-view>
    </b-container>
  </div>
</template>

<script>
import NavBar from "./components/NavBar";
export default {
  name: "App",
  components: {NavBar},
};
</script>

<style>
</style>
