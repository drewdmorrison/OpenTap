<template>
  <div class="home">

    <div class="breweryList">
      <h3>View Breweries in Your Area</h3>
      <p>
        Check out hot new Breweries near you, and don't worry we didn't forget
        about your favorite either! Click the link below to check them out!
      </p>
      <router-link
        :to="{ name: 'breweries' }"
        class="homepage-links"
      >
        List of Breweries
      </router-link>
    </div>

    <div class="addBreweryLink" v-if="isAnonymous">
      <h3>Own a Brewery or are a Beer Lover?</h3>
      <p>
        Join our awesome selection of Colorado Breweries and spread the word of
        your awesome brews to a brand new audience! Or sign up to view reviews made by your fellow beer lovers in your area!
      </p>
      <router-link
        :to="{ name: 'register' }"
        class="homepage-links"
      >
        Register
      </router-link>
    </div>
    <div v-if="isBrewer || isAdmin">
      <h3>Want to add your brewery?</h3>
      <p>Fill out this form to request to add your brewery to our database</p>
      <router-link
        :to="{ name: 'addBrewery' }"
        class="homepage-links"
        id="addBrewery"
      >
        Add Brewery
      </router-link>
    </div>

    <div class="breweryLink" v-if="isAdmin">
      <h3>Admin Tools</h3>
      <p>
        Manage Requests made by Users who are claiming to own Breweries
      </p>
      <router-link
        :to="{ name: 'requests' }"
        class="homepage-links"
        id="viewRequests"
      >
        Manage Requests
      </router-link>
    </div>

  </div>
</template>

<script>
export default {
  name: "home",
  computed: {
    isBrewer() {
      return (this.$store.state.user.authorities != undefined) && this.$store.state.user.authorities[0].name == 'ROLE_BREWER'; 
    },
    isAdmin() {
      return (this.$store.state.user.authorities != undefined) && this.$store.state.user.authorities[0].name == 'ROLE_ADMIN'; 
    },
    isAnonymous() {
      return (this.$store.state.user.authorities == undefined);
    }
  }
};
</script>


<style scoped>

  .home {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    color: white;
    font-family: Cousine, "Monospace";
    text-align: center;
    padding-left: 3%;
    padding-right: 3%;
  }

  .homepage-links {
    display: grid;
    color: white;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-top: 20px;
    margin-bottom: 20px;
    background: rgba(0, 0, 0);
    border-radius: 18px;
    text-decoration: none;
    width: 11em;
    font-size: 2rem;
  }

  .homepage-links:hover {
    text-decoration: underline;
    color: rgba(255, 183, 100, 0.8);
  }

  .new-brewery-link {
    margin: 10px;
  }

  .home h3 {
    width: 12em;
    height: 20%;
    text-align: center;
    margin-top: 6%;
    color: white;
    background: rgba(0, 0, 0);
    border-radius: 18px;
    padding-top: 1%;
    font-size: 2rem;
  }

  .home p {
    width: 16em;
    height: 20%;
    text-align: center;
    margin-top: 6%;
    color: white;
    background: rgba(0, 0, 0);
    border-radius: 18px;
    padding-top: 1%;
    font-size: 1.5rem;
  }

  .breweryList {
    justify-self: center;
  }

  @media screen and (max-width: 1160px ){
      .home {
        flex-direction: column;
      }

      div {
        margin-bottom: 2rem;
      }
  }
</style>
