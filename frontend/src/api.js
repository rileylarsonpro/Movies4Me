import axios from "axios";
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = "http://192.168.50.66:8000";

class Api {
  getUser(id) {
    return axios.get(API_URL + `/users?userid=eq.${id}`)
  }
  getMovies() {
    return axios.get(API_URL + "/movies", {});
  }

  getMovieDetail(id) {
    return axios.get(API_URL + `/movies?movieid=eq.${id}`);
  }
  addMovie(movie){
    return axios.post(
      API_URL + "/movies",
      {
        ...movie,
        // add user id from JWT token
      },
      {
        headers: authHeader(),
      }
    );
  }
  
  addArticle(article) {
    return axios.post(
      API_URL + "/articles",
      {
        ...article,
        // add user id from JWT token
        userid: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  updateArticle(article) {
    return axios.patch(
      API_URL + `/articles?articleid=eq.${article.articleid}`,
      article,
      {
        headers: authHeader(),
      }
    );
  }
  updateMovie(movie) {
    return axios.patch(
      API_URL + `/movies?movieid=eq.${movie.movieid}`,
      movie,
      {
        headers: authHeader(),
      }
    );
  }

  deleteArticle(id) {
    return axios.delete(API_URL + `/articles?articleid=eq.${id}`, {
      headers: authHeader(),
    });
  }
  deleteMovie(id) {
    return axios.delete(API_URL + `/movies?movieid=eq.${id}`, {
      headers: authHeader(),
    });
  }

  publishArticle(id) {
    return axios.post(
      API_URL + "/rpc/publish",
      { id: id },
      {
        headers: authHeader(),
      }
    );
  }

  login(username, password) {
    return axios.post(API_URL + "/rpc/login", { username, password });
  }

  signup(username, password) {
    return axios.post(API_URL + "/rpc/signup", { username, password });
  }
}

export default new Api();
