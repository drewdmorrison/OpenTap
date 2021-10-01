<template>
    <div class="brewery-information">
        <router-link :to="{name: 'breweries'}" class="breweries-link">Back to Breweries</router-link>
        <img v-if="brewery.breweryPhoto != ''" :src="brewery.breweryPhoto" alt="Brewery Logo">
        <h1 class="brewery-name">{{ brewery.breweryName }}</h1>
        <p class="brewery-desc">{{ brewery.description == "" ? "No Description Yet": brewery.description}}</p>
        <h4 class="brewery-phone">{{ brewery.phoneNumber == "" ? "Phone Number Not Listed" : brewery.phoneNumber }}</h4>
        <div class="address">
            <h3>{{ brewery.address == "" ? "Address Not Listed" : brewery.address }}</h3>
            <h3 v-if="brewery.city != ''">{{ brewery.city}}, {{ brewery.stateName }} {{ brewery.zipCode }}</h3>
        </div>
        <a class="website-link" :href="'https://' + brewery.website" target="_blank">{{ brewery.website }}</a>
        <google-map v-if="location.latitude !== 0 && location.longitude !== 0" :location="{latitude: location.latitude, longitude: location.longitude}"/>
        <table v-if="brewery.hoursOfOperation != undefined" class="hours-of-operation">
            <tr>
                <th></th>
                <th class="hours">Hours</th>
                <th></th>
            </tr>
            <tr v-for="day in brewery.hoursOfOperation" :key="day.id">
                <th class="table-day">{{ day.day }}: </th>
                <td>{{ day.opened }}- </td>
                <td>{{ day.closed }}</td>
            </tr>
        </table>
        <router-link
            :to="{ name: 'updateBreweryForm' }"
            v-if="isAdmin || (isBrewer && brewery.brewerId === $store.state.user.id)"
            id="updateBrewery"
            class="link"
            tag="h3"
        >
            Update Brewery Info
        </router-link>
        <router-link :to="{ name: 'beers', params: {breweryId: $route.params.breweryId} }" class="link" tag="h3"> See List of Beers</router-link>
        <router-link :to="{ name: 'beerReviewsBrewery', params: {breweryId: $route.params.breweryId} }" v-if="isAdmin || (isBrewer && brewery.brewerId === $store.state.user.id)" class="link" tag="h3">Your Brewery's Beer Reviews</router-link>
        <router-link :to="{name: 'updateBeers', params: {breweryId: $route.params.breweryId} }" v-if="isAdmin || (isBrewer && brewery.brewerId === $store.state.user.id)" class="link" tag="h3">Update The List Of Beers</router-link>
        <h3 v-if="isBrewer && brewery.brewerId !== $store.state.user.id" @click="claimRequest" class="link">Claim this Brewery</h3>
    </div>
    
</template>

<script>
import breweryService from "../services/BreweryService.js";
import requestService from "../services/RequestService.js";
import geocodingService from "../services/GeocodingService.js";
import GoogleMap from "./GoogleMap.vue";

export default {
    data() {
        return {
            brewery: {},
            location: {
                latitude: 0,
                longitude: 0
            }
        }
    },
    created() {
        breweryService.getBreweryById(this.$route.params.breweryId)
        .then((response) => {
            this.brewery = response.data;
            geocodingService.getLatitudeAndLongitude(this.brewery).then(
                (response) => {
                    this.location = response.data;
                }
            ).catch(
                (error) => {
                    console.log(error);
                }
            )
        });

    },
    methods: {
        claimRequest() {
            let request = {
                userId: this.$store.state.user.id,
                statusId: 1,
                typeId: 2,
                breweryId: this.brewery.breweryId
            }
            requestService.makeRequest(request).then(
                (response) => {
                    if(response.status == 200) {
                        window.alert("Request to claim this Brewery has been made!");
                    } else {
                        window.alert("Error occured");
                    }
                }
            )
        }
    },
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
    },
    components: {
        GoogleMap
    }

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

* {
    margin: 0;
    padding: 0;
}

.brewery-information {
    width: 60%;
    margin:5% 20% 10% 20%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
    color: white;
    font-family: Cousine, 'Montserrat', sans-serif;
}
.brewery-information p {
    margin-right: 2%;
    margin-left: 2%;
}
.brewery-information > p, h1, h4 {
    text-align: center;
    margin-top: 1.2rem;
}

.brewery-information img {
    margin-top: 1.3rem;
    height: 200px;
    width: 200px;
}
.address {
    margin-top: 1.2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.breweries-link {
    color: black;
    text-align: center;
    width: 200px;
    padding: .8rem;
    background: rgba(255, 255, 255, .9);
    border-radius: 18px;
    text-decoration: none;
    margin-top: 20px;
}

.breweries-link:hover {
    text-decoration: underline;
}
.link {
    text-decoration: none;
    color: rgba(255, 183, 100, 1);
    margin-top: 15px;
    margin-bottom: 20px;
    font-size: 1.8rem;
}

.link:hover {
    text-decoration: underline;
    cursor: pointer;
}

.website-link {
    text-decoration: none;
    color: rgba(255, 183, 100, 1);
    margin-top: 15px;
    margin-bottom: 20px;
}

.website-link:hover {
    text-decoration: underline;
    cursor: pointer;
}

th {
    text-align: left;
}

td {
    text-align: right;
}

.hours {
    text-align: center;
}

@media (max-width: 750px) {
    .brewery-information {
        width: 96%;
        margin: 2%;
    }
}

</style>