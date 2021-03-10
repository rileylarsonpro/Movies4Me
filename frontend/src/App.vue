<template>
  <div id="app">
    <div id="NavBar">
      <router-view></router-view>
    </div>
    <b-container>
      <router-view></router-view>
    </b-container>
  </div>
</template>

<script>
export default {
  name: "App",
  components: {},
};
</script>

<style>
</style>
