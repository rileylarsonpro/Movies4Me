<template>
  <b-navbar>
      <b-navbar-brand :to="{ path: '/' }">Movies4Me Admin</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-item :to="{ path: '/logout' }">Logout</b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
</template>

<script>
module.exports = {
  data() {
    return {};
  },
};
</script>


<style scoped>
</style>