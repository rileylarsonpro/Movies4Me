import Vue from "vue";
import VueRouter from "vue-router";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

import App from "./App.vue";
import Home from "./pages/Home";
import Admin from "./pages/Admin";
import Login from "./pages/Login";
import Logout from "./pages/Logout";
import Register from "./pages/Register";
import Movie from "./pages/Movie";
import AdminMovieAdd from "./components/AdminMovieAdd";
import AdminMovieList from "./components/AdminMovieList";
import AdminMovieEdit from "./components/AdminMovieEdit";

Vue.config.productionTip = false;

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import { getJwtToken } from "./auth";
import { getUserIdFromToken } from "./auth";
import Api from "./api";

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueRouter);

const checkAuth = function(to, _, next) {
  const token = getJwtToken();
  if (token === undefined || token === "undefined" || token === null) {
    // redirect to login because we don't have token yet
    next({
      path: "/login",
      params: { nextUrl: to.fullPath },
    });
  } else {
    next();
  }
};

const checkAdmin = function (to, _, next){
  const token = getJwtToken();
  if (token === undefined || token === "undefined" || token === null) {
    // redirect to login because we don't have token yet
    next({
      path: "/login",
      params: { nextUrl: to.fullPath },
    });
  } else {
    let userId = getUserIdFromToken(token);
    Api.getUser(userId)        
    .then((res) => {
      if (!res.data[0].moderatorstatus) {
        next({
          path: "/",
          params: { nextUrl: to.fullPath },
        });
      } else {
        next();
      }
    });
  }
}

const router = new VueRouter({
  routes: [
    { path: "/", beforeEnter: checkAuth, component: Home },
    { path: "/movie/:id", component: Movie },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    { path: "/register", component: Register },
    {
      path: "/admin",
      component: Admin,
      beforeEnter: checkAdmin,
      children: [
        { path: "add", component: AdminMovieAdd },
        { path: "edit/:id", component: AdminMovieEdit },
        { path: "", component: AdminMovieList },
      ],
    },
  ],
});

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
