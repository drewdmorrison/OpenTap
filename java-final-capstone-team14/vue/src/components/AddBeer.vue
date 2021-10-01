<template>
    <div class="new-brewery-container">
        <h1 class="new-beer-heading">Add a New Brewery</h1>
        <form class="form-new-brewery" @submit.prevent="addBeer">
            <p>*Required Fields</p>
            <label for="beer-name"><span>*</span>Beer Name: </label>
            <input 
                type="text"
                id="beer-name"
                placeholder="Beer Name"
                v-model="newBeer.beerName"
                required
                autofocus
            > 
            <label for="beer-type"><span>*</span>Beer Type: </label>
            <input 
                type="text"
                id="beer-type"
                placeholder="Beer Type"
                v-model="newBeer.beerTypeName"
                required
                autofocus
            > 
            <label for="beer-description"><span>*</span>Description: </label>
            <textarea id="beer-description" 
                cols="40" 
                rows="3" 
                v-model="newBeer.beerDescription"
                placeholder="Please enter a description of the beer"
            >
            </textarea>
            <label for="beer-abv"><span>*</span>ABV: </label>
            <input 
                type="number"
                step="0.1"
                id="beer-abv"
                placeholder="0.0"
                v-model="newBeer.abv"
                required
                autofocus
            > 
            <label for="beer-ibu"><span>*</span>IBU: </label>
            <input 
                type="number"
                id="beer-ibu"
                placeholder="0"
                v-model="newBeer.ibu"
                required
                autofocus
            > 
            <label for="beer-photo"><span>*</span>Photo URL: </label>
            <input 
                type="url"
                id="beer-photo"
                placeholder="www.img.com"
                v-model="newBeer.beerPhoto"
                required
                autofocus
            > 
            <div class="buttons">
                <button class="submit" type="submit">Add Beer</button>
                <button @click.prevent="cancel" class="cancel">Cancel</button>
            </div>
        </form>
    </div>
</template>

<script>
import beerService from "@/services/BeerService.js";

export default {
    data() {
        return {
            newBeer: {
                beerName: "",
                beerTypeName: "",
                beerDescription: "",
                abv: 0.0,
                ibu: 0,
                beerPhoto: "",
                breweryId: this.$route.params.breweryId
            }
        }
    },
    methods: {
        addBeer() {
            //convert beer type to first letter capitalized before calling the addBeer method
            beerService.addBeer(this.newBeer).then(
                (response) => {
                    if(response.status == 200) {
                        window.alert("Beer added");
                        this.$router.push({name: "beers", params: {breweryId: this.$route.params.breweryId}});
                    }
                }
            ).catch(
                (error) => {
                    console.log(error);
                }
            )
        },
        resetForm() {
            this.newBeer = {
                beerName: "",
                beerTypeName: "",
                beerDescription: "",
                abv: 0,
                ibu: 0.0,
                beerPhoto: "",
                breweryId: this.$route.params.breweryId
            }
        },
        cancel() {
            this.resetForm();
            this.$router.push({name: "updateBeers", params: {breweryId: this.$route.params.breweryId}});
        }
    }
}
</script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

    *{
        margin: 0;
        padding: 0;
    }

    .new-beer-heading {
        margin-bottom: 4%;
        margin-top: 4%;
        text-decoration: underline;
    }

    .new-brewery-container {
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

    .form-new-brewery {
        display: flex;
        flex-direction: column;
        width: 60%;
        align-items: center;
        justify-content: center;
        border-radius: 4px;
    }
    .form-new-brewery p {
        color:red;
        margin-bottom: 1.4rem;
    }

    span {
        color: red;
    }

    .form-new-brewery input {
        border: 1px solid #000;
        border-radius: 4px;
        width: 50%;
        height: 1.5rem;
        margin-bottom: 1.6rem;
    }

    .buttons {
        width: 100%;
        display: flex;
        justify-content: space-evenly;
        color: black;
    }
 
    button {
        height: 1.75rem;
        width: 150px;
        margin-bottom: 1.2rem;
        margin-top: 1.2rem;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        font-weight: bold;
    }

    .cancel {
        background-color: rgb(255, 10, 10);
    }

    .submit {
        background: rgb(255, 183, 100);
    }



    @media (max-width: 800px) {
        .form-signin {
            width: 90%;
        }
        .login-div input {
            width: 80%;
        }
    }
</style>