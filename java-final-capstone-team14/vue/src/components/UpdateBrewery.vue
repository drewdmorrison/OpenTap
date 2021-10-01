<template>
    <div class="update-brewery-container">
        <h1 class="update-brewery-heading">Update Brewery</h1>
        <form class="form-update-brewery" @submit.prevent="updateBrewery">
            <label for="brewery-name"><span>*</span>Brewery Name: </label>
            <input 
                type="text"
                id="brewery-name"
                placeholder="Name"
                v-model="brewery.breweryName"
                required
                autofocus
            >
            <label for="brewery-address">Address: </label>
            <input 
                type="text"
                id="brewery-address"
                placeholder="1234 Smith Street"
                v-model="brewery.address"
                autofocus
            >
            <label for="brewery-city">City: </label>
            <input 
                type="text"
                id="brewery-city"
                placeholder="Denver"
                v-model="brewery.city"
                autofocus
            >
            <label for="brewery-zipcode">Zip Code: </label>
            <input 
                type="text"
                id="brewery-zipcode"
                placeholder="12345"
                v-model="brewery.zipCode"
                autofocus
            >
            <label for="brewery-description">Description: </label>
            <textarea id="brewery-description" 
                cols="50" 
                rows="6" 
                v-model="brewery.description"
                placeholder="Please enter a description of the brewery"
            >
            </textarea>
            <label for="brewery-website">Website URL: </label>
            <input 
                type="text"
                id="brewery-website"
                placeholder="www.website.com"
                v-model="brewery.website"
                autofocus
            >
            <label for="brewery-phone-number">Phone Number: </label>
            <input 
                type="text"
                id="brewery-phone-number"
                placeholder="123-456-7891"
                v-model="brewery.phoneNumber"
                autofocus
            >
            <label for="brewery-photo">Brewery Image URL: </label>
            <input 
                type="text"
                id="brewery-photo"
                placeholder="www.img.com"
                v-model="brewery.breweryPhoto"
                autofocus
            >

            <label><span>*</span>Hours of Operation</label>
            <div class="operations">
                <table>
                    <tr v-for="day in brewery.hoursOfOperation" :key="day.id">
                        <th>{{ day.day }}</th>
                        <td><input class="time-input" type="time" v-model="day.openedAsLocalTime"></td>
                        <td><input class="time-input" type="time" v-model="day.closedAsLocalTime"></td>
                    </tr>
                </table>
            </div>
            <div v-if="brewery.hoursOfOperation == 0" class="operations">
                <table>
                    <tr v-for="day in newOperations" :key="day.id">
                        <th>{{ day.day }}</th>
                        <td><input class="time-input" type="time" v-model="day.openedAsLocalTime" required></td>
                        <td><input class="time-input" type="time" v-model="day.closedAsLocalTime" required></td>
                    </tr>
                </table>
            </div>
        

            <div class="buttons">
                <button class="submit" type="submit">Update Brewery</button>
                <button class="cancel" @click.prevent="cancel">Cancel</button>
            </div>
        </form>
    </div>
</template>

<script>

import breweryService from "@/services/BreweryService.js";

export default {
    data() {
        return {
            brewery: {},
            newOperations: [
                { day: "Monday" },
                { day: "Tuesday" },
                { day: "Wednesday" },
                { day: "Thursday" },
                { day: "Friday" },
                { day: "Saturday" },
                { day: "Sunday" }
            ]
        }
    },
    created() {
        breweryService.getBreweryById(this.$route.params.breweryId).then(
            (response) => {
                this.brewery = response.data;
            }
        )
    },
    methods: {
        updateBrewery() {
            if(this.brewery.hoursOfOperation.length == 0) {
                breweryService.addHoursOfOperation(this.$route.params.breweryId, this.newOperations).then(
                    (response) => {
                        this.brewery.hoursOfOperation = response.data;
                        this.sendRequest();
                    }
                );
            } else {
                this.sendRequest();
            }
        },

        sendRequest() {
            breweryService.updateBrewery(this.brewery).then(
                (response) => {
                    if(response.status === 200) {
                        window.alert("Brewery Information Has Been Updated!")
                        this.$router.push({name: "brewery", params: {brewerId: this.brewery.breweryId}})
                    } else {
                        window.alert("Bad Request")
                    }
                }
            );
        },
        cancel() {
            this.$router.push({name: "brewery", params: {brewerId: this.brewery.breweryId}});
        }
    }
}
</script>

<style scoped>
    *{
        margin: 0;
        padding: 0;
    }

    .update-brewery-heading {
        margin-bottom: 4%;
        margin-top: 4%;
        text-decoration: underline;
    }

    .update-brewery-container {
        width: 60%;
        margin-left: 20%;
        margin-right: 20%;
        margin-bottom: 8%;
        margin-top: 4%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background: rgba(0, 0, 0, .8);
        border-radius: 4px;
        color: white;
        font-family: Cousine, 'Montserrat', sans-serif;
    }

    .form-update-brewery {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border-radius: 4px;
    }

    .form-update-brewery input {
        border: 1px solid #000;
        border-radius: 4px;
        width: 100%;
        height: 1.5rem;
        margin-bottom: 1.6rem;
    }

    .operations {
        width: 100%;
        margin: .5rem;
        display: flex;
        flex-direction: column;
        justify-content: space-around;
    }

    .time-input {
        width: 85%;
    }
    

    .buttons {
        width: 100%;
        display: flex;
        justify-content: space-evenly;
        
    }
 
    button {
        height: 1.75rem;
        width: 150px;
        margin-bottom: 1.2rem;
        margin-top: 1.2rem;
        border-radius: 4px;
        color: black;
        font-weight: bold;
        cursor: pointer;
    }

    .cancel {
        background-color: rgb(255, 10, 10);
    }

    .submit {
        background: rgb(255, 183, 100);
    }

</style>