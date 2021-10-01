<template>
    <div class="new-brewery-container">
        <h1 class="new-brewery-heading">Add a New Brewery</h1>
        <form class="form-new-brewery" @submit.prevent="addBrewery">
            <p>*Required Fields</p>
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
            <div class="buttons">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Add Brewery</button>
                <button @click="cancel" class="cancel-btn">Cancel</button>
            </div>
        </form>
    </div>
</template>

<script>
import breweryService from "@/services/BreweryService.js";
import requestService from "@/services/RequestService.js";
export default {
    data() {
        return {
            brewery: {
                breweryId: 0,
                breweryName: "",
                address: "",
                city: "",
                stateName: "CO",
                zipCode: "",
                description: "",
                brewerId: this.$store.state.user.id,
                website: "",
                phoneNumber: "",
                breweryPhoto: "",
                approved: false
            }
        }
    }, 
    methods: {
        addBrewery() {
            if(this.$store.state.user.authorities[0].name == "ROLE_ADMIN") {
                this.brewery.approved = true;
            } else {
                this.brewery.approved = false 
            }
            breweryService.addNewBrewery(this.brewery).then(
                (response) => {
                    if(response.status == 200) {
                        this.brewery = response.data;
                        if(this.$store.state.user.authorities[0].name != "ROLE_ADMIN") {
                            this.makeRequest(this.brewery.breweryId);
                        }
                        this.resetForm();
                        this.$router.push({name: 'breweries'});
                    }
                }
            ).catch((error) => {
                if(error.response.status === 400) {
                    Window.alert("Bad Request")
                }
            });
        },
        makeRequest(breweryId) {
            requestService.makeRequest({
                "userId": this.$store.state.user.id,
                "statusId": 1,
                "typeId": 1,
                "breweryId": breweryId 
            }).then(
                (response) => {
                    if(response.status == 200) {
                        window.alert("Request Made!");
                    }
                    this.$router.push({name: "home"});
                }
                ).catch(
                    (error) => {
                        window.alert(error);
                    }
                );
        },
        resetForm() {
            this.brewery = {
                breweryId: 0,
                breweryName: "",
                address: "",
                city: "",
                stateName: "CO",
                zipCode: "",
                description: "",
                brewerId: this.$store.state.user.id,
                website: "",
                phoneNumber: "",
                breweryPhoto: "",
                approved: false
            }
        },
        cancel() {
            this.resetForm();
            this.$router.push({name: "home"});
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap');

    *{
        margin: 0;
        padding: 0;
    }

    .new-brewery-heading {
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
    }
 
    button {
        height: 1.75rem;
        width: 150px;
        margin-bottom: 1.2rem;
        margin-top: 1.2rem;
        border-radius: 4px;
        background: rgb(255, 183, 100);
        color: black;
        cursor: pointer;
        font-weight: bold;
    }

    .cancel-btn {
        background-color: rgb(255, 10, 10);
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