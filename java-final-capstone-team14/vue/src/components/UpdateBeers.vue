<template>
  <div class="main">
      <div class="links">
        <router-link :to="{ name: 'brewery', params: {breweryId: $route.params.breweryId} }" tag="h2" class="brewery-link">Back to Brewery</router-link>
        <router-link :to="{ name: 'addBeer', params: {breweryId: $route.params.breweryId} }" tag="h2" class="brewery-link">Add a New Beer</router-link>
      </div>
      <div class="beer-info">
          <div class="beers" v-for="beer in beers" :key="beer.beerId">
              <h3 class="beer-name"> {{beer.beerName}} </h3>
              <button @click.stop="removeBeer(beer.beerId)" class="delete-btn">Delete Beer</button>
          </div>
      </div>
  </div>
</template>

<script>
import beerService from "@/services/BeerService.js";

export default {
    data() {
        return {
            beers: [],
        }
    },
    methods: {
        removeBeer(beerId) {
            if (
                confirm("Are you sure you would like to delete this beer? This cannot be undone")
            ) {
                beerService.deleteBeer(beerId)
                .then(() => {
                    this.getBeersFromBrewery();
                });
            }
        },
        getBeersFromBrewery() {
            beerService.getBeersByBreweryId(this.$route.params.breweryId)
            .then((response) => {
                this.beers = response.data;
            });
            return this.beers;
            
        },
    },
    created() {
        beerService.getBeersByBreweryId(this.$route.params.breweryId)
        .then((response) => {
            this.beers = response.data;
        })
    }
}
</script>

<style scoped>
    .main {
        font-family: Cousine, "Monospace";
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

    .main > h1 {
        background: rgba(0, 0, 0, .8);
        padding: 10px;
        border-radius: 20px;
    }

    .beers {
        display: flex;
        flex-direction: column;
        width: 80%;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, .8);
        border-radius: 8px;
        padding: 12px 10px 10px 12px;
        margin: 10px;
    }

    .beer-name {
        font-size: 1.75rem;
        width: 10em;
        color: white;
        padding: 10px;
        height: 20%;
        margin-top: 3%;
        border-radius: 12px;
        text-align: center;
    }
    

    div.beer-info {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        
    }

    .links {
        margin-top: 2rem;
        display: flex;
        width: 60%;
        justify-content: space-around;
    }

    .links:hover {
        cursor: pointer;
    }

    .delete-btn {
        background-color:rgb(255, 183, 100);
        color: black;
    }

    @media screen and (max-width: 768px) {
        div.beer-info {
            grid-template-columns: 1fr 1fr;
        }
    }

</style>