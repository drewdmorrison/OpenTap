<template>
  <div class="new-review-container">
      <div class="router">
          <router-link :to="{name: 'beer', params: {breweryId: $route.params.breweryId, beerId: $route.params.beerId}}" class="beers-link">Back to Beer</router-link>
      </div>
      <h1 class="new-review-heading">Add a Review</h1>
      <form class="form-new-review" @submit.prevent="addReview">
          <p class="required">*Required</p>
          <label for="review-title"><span class="required">*</span>Review Title: </label>
          <input type="text" id="review-title" placeholder="title" v-model="review.reviewTitle" required autofocus>

          <label for="review-description"><span class="required">*</span>Review Description: </label>
          <textarea type="text" id="review-description" placeholder="description" cols="50" rows="6" v-model="review.reviewDescription" required autofocus></textarea>
          
          <label for="rating"><span class="required">*</span>Rating:</label>
          <select id="rating" v-model.number="review.stars" required>
              <option value="1">1 Pint</option>
              <option value="2">2 Pints</option>
              <option value="3">3 Pints</option>
              <option value="4">4 Pints</option>
              <option value="5">5 Pints</option>
          </select>
           <div class="buttons">
                <button class="submit" type="submit">Add Review</button>
                <button @click="cancel" class="cancel">Cancel</button>
            </div>
      </form>
  </div>
</template>

<script>
import reviewService from "@/services/ReviewService.js";

export default {
    data() {
        return {
            review: {
                beerId: this.$route.params.beerId,
                // beerName: "",
                reviewDescription: "",
                // reviewId: "",
                reviewTitle: "",
                stars: 0,
                userId: this.$store.state.user.id,
                //username: this.$store.state.user.username,
            },
        
        }
    },
    methods : {
        addReview() {
            reviewService.addNewReview(this.review, this.$route.params.breweryId, this.$route.params.beerId)
            .then((response) => {
                if(response.status == 200) {
                    this.resetForm();
                    this.$router.push({name: 'beerReviews', params: {breweryId: this.$route.params.breweryId, beerId: this.$route.params.beerId}});
                }
            }).catch((error) => {
               if(error.response.status == 400) {
                    Window.alert("Bad Request")
                }
            })
            
        },
        resetForm() {
            this.review = {
                 beerId: this.$route.params.beerId,
                // beerName: "",
                reviewDescription: "",
                // reviewId: "",
                reviewTitle: "",
                stars: "",
                userId: this.$store.state.user.id,
                // username: this.$store.state.user.username,
            }
        },
        cancel() {
            this.resetForm();
            this.$router.push({name: "home"})
        }
    }
}
</script>

<style>
* {
    margin: 0;
    padding: 0;
}

.new-review-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 60%;
    background: rgba(0, 0, 0, .8);
    border-radius: 4px;
    margin: 4% 20% 8% 20%;
    color: white;
    font-family: Cousine, 'Montserrat', sans-serif;
    padding-top: 1rem;
}

.new-review-heading {
    margin-bottom: 4%;
    margin-top: 4%;
    text-decoration: underline;
}

.form-new-review {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 60%;
}

.required {
    color: red;
    margin-bottom: 1rem;
}


.form-new-review input{
    border: 1px solid #000;
    border-radius: 4px;
    width: 80%;
    height: 1.5rem;
    margin-bottom: 1.6rem;
}

#review-description {
    margin-bottom: 1rem;
    border-radius: 4px;
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
    cursor: pointer;
    font-weight: bold;
}

.cancel {
    color: black;
    background-color: rgb(255, 10, 10);
}

.submit {
    color: black;
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