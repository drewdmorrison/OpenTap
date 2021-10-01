<template>
    <div class="container">
        <h1 class="heading">Breweries</h1>
        <table id="breweries-filter" class="heading">
            <thead>
                <tr>
                    <th>Brewery Name</th>
                    <th>City</th>
                    <th>Zip Code</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="text" id="brewery-name-filter" v-model="filter.breweryName">
                    </td>
                    <td>
                        <input type="text" id="brewery-city-filter" v-model="filter.city">
                    </td>
                    <td>
                        <input type="text" id="brewery-zipcode-filter" v-model="filter.zipcode">
                    </td>
                    <td>
                        <button @click.prevent="resetTable" class="cancel-btn">Reset</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="breweries-container">
            <div v-for="brewery in filteredBreweries" :key="brewery.breweryId" class="brewery">
                <router-link :to="{ name: 'brewery', params: {breweryId: brewery.breweryId} }" class="link" tag="h3"> {{ brewery.breweryName }} </router-link>
            </div>
        </div>
    </div>
</template>
<script>

import breweryService from "@/services/BreweryService.js";

export default {
    data() {
        return {
           breweries: [],
           filter: {
               breweryName: "",
               city: "",
               zipcode: ""
           }
        }
    },
    created() {
        breweryService.getBreweries().then(
            (response) => {
                this.breweries = response.data;
            }
        );
    },
    computed: {
        approvedBreweries() {
            return this.breweries.filter(
                (brewery) => {
                    return brewery.approved;
                }
            ); 
        },
        filteredBreweries() {
            let filteredBreweries = this.approvedBreweries;
            if(this.filter.breweryName != "") {
                filteredBreweries = filteredBreweries.filter(
                    (brewery) => {
                        return brewery.breweryName.toLowerCase().includes(this.filter.breweryName.toLowerCase());
                    }
                )
            }
            if(this.filter.city != "") {
                filteredBreweries = filteredBreweries.filter(
                    (brewery) => {
                        return brewery.city.toLowerCase().includes(this.filter.city.toLowerCase());
                    }
                )
            }
            if(this.filter.zipcode != "") {
                filteredBreweries = filteredBreweries.filter(
                    (brewery) => {
                        return brewery.zipCode.includes(this.filter.zipcode);
                    }
                )
            }
            return filteredBreweries;
        }
    },
    methods: {
        resetTable() {
            this.filter =  {
               breweryName: "",
               city: "",
               zipcode: ""
           }
        }
    }
}
</script>

<style scoped>
    * {
        margin: 0;
        padding: 0;
    }

    .container {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-family: Cousine;
        
    }

    .heading {
        width: 10em;
        background: rgba(0, 0, 0, .8);
        color: white;
        padding: 10px;
        height: 20%;
        margin-top: 3%;
        border-radius: 12px;
        text-align: center;
    }


    #breweries-filter {
        width: 60%;
        height: 20%;
        width: 12em;
        text-align: center;
        margin-top: 3%;
        padding: 10px;
        color: white;
        background: rgba(0, 0, 0, .8);
        border-radius: 12px;
    }


    .brewery {
        width: 350px;
        height: 25px;
        margin: 10px;
        padding: 20px 0;
        border: 2px solid black;
        background-color: rgba(0, 0, 0, .8);
        border-radius: 18px;
        text-align: center;
        vertical-align: center;
        color: white;
    }

    .link {
        text-decoration: none;
        color:white;
    }

    .link:hover {
        text-decoration: underline;
        cursor: pointer;
        color:  rgb(255, 183, 100);
    }

    .cancel-btn {
        background-color:  rgb(255, 183, 100);
        color: black;
    }

    .breweries-container {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        margin-top: 40px;
        margin-bottom: 6rem;
        
        
    }


    @media screen and (max-width: 1150px){
        .breweries-container {
            grid-template-columns: 1fr 1fr;
        }

        .heading {
            width: 10em;
        }
    }

    @media screen and (max-width: 768px){
        .breweries-container {
            grid-template-columns: 1fr;
        }

        .brewery {
            width: 96%;
            margin: 2%;
            font-size: .8rem;
        }

        .heading {
            width: 8em;
        }
    }

</style>