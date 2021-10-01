<template>
    <div id="main">
    <div class="container">
        <router-link :to="{ name: 'brewery', params: {breweryId: breweryId} }" class="brewery-link">Back to Brewery</router-link>
        <div class="beer-list">
            <h1 class="beers-heading">Beer List</h1>
            <h2 v-if="beers.length === 0">Beer list is coming soon...</h2>
            <div v-for="beer in beers" :key="beer.id" class="beer-div">
                <router-link :to="{name: 'beer', params: {breweryId: breweryId, beerId: beer.beerId}}" class="beer-link">{{ beer.beerName }}</router-link>
            </div>
        </div>
    </div>
    </div>
</template>

<script>
import beerService from "@/services/BeerService.js";
export default {
    data() {
        return {
            breweryId: this.$route.params.breweryId,
            beers: []
        }
    },
    created() {
        beerService.getBeersByBreweryId(this.$route.params.breweryId).then(
            (response) => {
                this.beers = response.data;
            }
        )
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

* {
    margin: 0;
    padding: 0;
}

#main {
    font-family: Cousine, 'Montserrat', sans-serif;
    color: white;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100vh;
    align-items: center;
    justify-content: center; 
    
}

.beers-heading {
    text-decoration: underline;
    margin-bottom: 1rem;
}

.container {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
    justify-content: center;
}

.beer-div {
    margin: 10px;
}

.beer-list {
    display: flex;
    flex-direction: column;
    width: 60%;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
    font-size: 2rem;
    padding-left: 1%;
    padding-right: 1%;
    padding-bottom: 1%;
}

.beer-link {
    color: white;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-top: 20px;
    border-radius: 18px;
    text-decoration: none;
}

.beer-link:hover {
    text-decoration: underline;
    color: rgba(255, 183, 100, .8);
}

.brewery-link {
    color: white;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-bottom: 20px;
    background: rgba(0, 0, 0, .8);
    border-radius: 18px;
    text-decoration: none;
}

.brewery-link:hover {
    text-decoration: underline;
    color: rgba(255, 183, 100, .8);
}
</style>