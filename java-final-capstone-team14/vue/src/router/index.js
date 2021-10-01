import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import BreweriesView from '../views/BreweriesView.vue'
import SelectedBrewery from '../views/SelectedBrewery.vue'
import BeersView from "../views/BeersView.vue"
import SelectedBeer from "../views/SelectedBeer.vue"
import AddBrewery from "../views/AddBreweryForm.vue"
import BeerReviewsView from "../views/BeerReviewsView.vue"
import AddReviewForm from "../views/AddReviewForm.vue"
import RequestsView from "../views/RequestsView.vue"
import UpdateBreweryForm from "../views/UpdateBreweryForm.vue"
import BeerReviewBreweryView from "../views/BeerReviewBreweryView.vue"
import AddBeerView from "../views/AddBeerView.vue"
import UpdateBeersView from "../views/UpdateBeersView.vue"

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/breweries",
      name: "breweries",
      component: BreweriesView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewery/:breweryId",
      name: "brewery",
      component: SelectedBrewery,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewery/:breweryId/beers",
      name: "beers",
      component: BeersView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/:breweryId/beers/:beerId",
      name: "beer",
      component: SelectedBeer,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/new-brewery-form",
      name: "addBrewery",
      component: AddBrewery,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/:breweryId/beers/reviews/:beerId",
      name: "beerReviews",
      component: BeerReviewsView,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewery/:breweryId/beers/:beerId/new-review",
      name: "addReview",
      component: AddReviewForm,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/admin/requests",
      name: "requests",
      component: RequestsView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/brewery/:breweryId/update",
      name: "updateBreweryForm",
      component: UpdateBreweryForm,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/:breweryId/beers/reviews",
      name: "beerReviewsBrewery",
      component: BeerReviewBreweryView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path:"/:breweryId/addBeer",
      name: "addBeer",
      component: AddBeerView,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/update-beer/:breweryId",
      name: "updateBeers",
      component: UpdateBeersView,
      meta: {
        requiresAuth: true
      }
    },

  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
