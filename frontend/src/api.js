import axios from "axios";
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = "http://192.168.50.66:8000";

class Api {
  getUser(id) {
    return axios.get(API_URL + `/users?userid=eq.${id}`)
  }

  getMovies() {
    return axios.get(API_URL + "/movies");
  }
  getSuggestedMovies(userid) {
    return axios.get(API_URL + `/users_movies_suggestions?userid=eq.${userid}`)
  }
  getSeenMovies(userid) {
    return axios.get(API_URL + `/users_seen_movies?userid=eq.${userid}`)
  }
  getMovieDetail(id) {
    return axios.get(API_URL + `/movies?movieid=eq.${id}`);
  }
  getTags() {
    return axios.get(API_URL + `/tags`);
  }
  getMovieTags(id) {
    return axios.get(API_URL + `/movie_has_tags?movieid=eq.${id}`);
  }

  getServicesForMovie(movieid) {
    return axios.get(API_URL + `/platform_region_movies?movieid=eq.${movieid}`);
  }

  getReviews(movieid) {
    return axios.get(API_URL + `/users_reviews_movies?movieid=eq.${movieid}&approvalstatus=eq.1`);
  }
  userlikesTag(userid, tagid){
    return axios.post(API_URL + `/likes`, { userid, tagid });
  }
  addReview(review) {
    return axios.post(
      API_URL + "/reviews",
      {
        ...review,
        // add user id from JWT token
        userid: getUserIdFromToken(getJwtToken()),
      },
      {
        headers: authHeader(),
      }
    );
  }

  // ADMIN FUNCTIONS:
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
  getNonAprovedReviews(){
    return axios.get(API_URL + `/users_reviews_movies?approvalstatus=eq.0`);
  }

  publishReview(reviewid) {
    return axios.patch(
      API_URL + `/reviews?reviewid=eq.${reviewid}`, 
      { 
        approvalstatus: true
      },
      {
        headers: authHeader(),
      })
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
  
  deleteMovie(id) {
    return axios.delete(API_URL + `/movies?movieid=eq.${id}`, {
      headers: authHeader(),
    });
  }
  
  addTagToMovie(movieid, tagid) {
    return axios.post(API_URL + `/belongs_to`, 
    { movieid, tagid },
    {
      headers: authHeader(),
    });
  }
  // AUTH FUNCTIONS
  login(username, password) {
    return axios.post(API_URL + "/rpc/login", { username, password });
  }

  signup(username, password) {
    return axios.post(API_URL + "/rpc/signup", { username, password });
  }
}

export default new Api();
