<template>
    <div class="beer-information">
        <router-link :to="{name: 'beers', params: {breweryId: $route.params.breweryId}}" class="beers-link">Back to Beers</router-link>
        <img :src="beer.beerPhoto" alt="Beer Photo">
        <h1 class="beer-name">{{ beer.beerName == "" ? "Not Listed" : beer.beerName }}</h1>
        <h4 class="beer-type">Beer Type: {{ beer.beerTypeDesc == "" ? "Not Listed" : beer.beerTypeDesc }}</h4>
        <p class="beer-desc">{{ beer.beerDescription == "" ? "No Description" : beer.beerDescription }}</p>
        <h4 class="abv">ABV: {{ beer.abv == 0 ? "Not Listed" : beer.abv }}</h4>
        <h4 class="ibu">IBU's: {{ beer.ibu == 0 ? 'Not Listed': beer.ibu }}</h4>
        <router-link :to="{name: 'beerReviews', params: {breweryId: $route.params.breweryId, beerId: $route.params.beerId} }" class="reviews-link">See Reviews!</router-link>

    </div>
</template>

<script>
import beerService from "../services/BeerService.js";
export default {
    data() {
        return {
            beer: {},
        }
    },
    created() {
        beerService.getBeerById(this.$route.params.beerId)
        .then((response) => {
            this.beer = response.data;
        })
    }
}
</script>

<style>

* {
    margin: 0;
    padding: 0;
}

.beer-information {
    width: 50%;
    margin: 5% 25% 10% 25%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
    color: white;
    font-family: Cousine, 'Montserrat', sans-serif;
}

.beer-information p {
    margin-right: 2%;
    margin-left: 2%;
}
.beer-information > p, h1, h4 {
    text-align: center;
    margin-top: 1.3rem;
}

.beer-information img {
    margin-top: 1.3rem;
    height: 250px;
    width: 240px;
}

.beers-link {
    color: black;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-bottom: 20px;
    background: rgba(255, 255, 255, .9);
    border-radius: 18px;
    text-decoration: none;
    margin-top: 20px;
    font-weight: bold;
}

.beers-link:hover {
    text-decoration: underline;
    
}

.reviews-link {
    color: black;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-bottom: 20px;
    background: rgba(255, 255, 255, .9);
    border-radius: 18px;
    text-decoration: none;
    margin-top: 20px;
    font-weight: bold;
}

.reviews-link:hover {
    text-decoration: underline;
    
}
.ibu {
    margin-bottom: 20px;
}

@media (max-width: 750px) {
    .beer-information {
        width: 96%;
        margin: 15% 2%;
    }
}

</style>