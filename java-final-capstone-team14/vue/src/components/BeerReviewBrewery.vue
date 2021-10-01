<template>
  <div class="main">
      <div class="router">
        <router-link :to="{ name: 'brewery', params: {breweryId: $route.params.breweryId} }" class="brewery">Back to Brewery</router-link>
      </div>
      <div v-if="reviews.length != 0" class="container">
              <h1 class="heading">Reviews For {{reviews[0].breweryName}}</h1>
              <span class="brewery-average">Average Beer Rating {{averageRating}}</span>
              <table id="tblReviews">
                  <thead>
                      <button @click="resetTable" class="reset-btn">Reset Table</button>
                      <tr>
                          <th>Beer Name</th>
                          <th>Username</th>
                          <th>Pints</th>
                          <th>Title</th>
                          <th>Description</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td>
                              <input type="text" id="beerNameFilter" v-model="filter.beerName">
                          </td>
                          <td>
                              <input type="text" id="usernameFilter" v-model="filter.username">
                          </td>
                          <td>
                              <select type="text" id="pintsFilter" v-model="filter.stars">
                                    <option value="1">1 Pint</option>
                                    <option value="2">2 Pints</option>
                                    <option value="3">3 Pints</option>
                                    <option value="4">4 Pints</option>
                                    <option value="5">5 Pints</option>
                              </select>
                          </td>
                          <td>
                              <input type="text" id="titleFilter" v-model="filter.reviewTitle">
                          </td>
                          <td>
                              <input type="text" id="descriptionFilter" v-model="filter.reviewDescription">
                          </td>
                      </tr>
                    <tr v-for="review in filteredList" :key="review.reviewId" class="review">
                        <td>{{ review.beerName }}</td>
                        <td>{{ review.username }}</td>
                        <td>{{ review.stars }} </td>
                        <td>{{ review.reviewTitle }}</td>
                        <td>{{ review.reviewDescription}}</td>
                    </tr>
                  </tbody>
              </table>
          </div>
  </div>
</template>

<script>
import reviewService from "@/services/ReviewService.js"

export default {
    data() {
        return {
            reviews: [],
            filter: {
                reviewTitle: '',
                stars: 0,
                reviewDescription: '',
                username: '',
                beerName: '',
            }
        }
    },
    created() {
        reviewService.getReviewsByBreweryId(this.$route.params.breweryId)
        .then((response) => {
            this.reviews = response.data;
        })
    },
    computed: {
        filteredList() {
            let filteredReviews = this.reviews;
            if (this.filter.beerName != "") {
                filteredReviews = filteredReviews.filter((review) => {
                   return review.beerName.toLowerCase().includes(this.filter.beerName.toLowerCase());
                })
            }
            if (this.filter.reviewDescription != "") {
                filteredReviews = filteredReviews.filter((review) => {
                   return review.reviewDescription.toLowerCase().includes(this.filter.reviewDescription.toLowerCase());
                })
            }
            if (this.filter.reviewTitle != "") {
                filteredReviews = filteredReviews.filter((review) => {
                   return review.reviewTitle.toLowerCase().includes(this.filter.reviewTitle.toLowerCase());
                })
            }
            if (this.filter.username != "") {
                filteredReviews = filteredReviews.filter((review) => {
                   return review.username.toLowerCase().includes(this.filter.username.toLowerCase());
                })
            }
            if (this.filter.stars != 0) {
                filteredReviews = filteredReviews.filter((review) => {
                   return review.stars == this.filter.stars;
                })
            }

            return filteredReviews;

        },
        averageRating() {
            let sum = this.reviews.reduce((currentSum, review) => {
                return currentSum + review.stars;
            }, 0);
            if (sum === 0) {
                return 0;
            } else {
                return (sum / this.reviews.length).toFixed(2);
            }   
        }
    },
    methods: {
       resetTable() { 
           this.filter = {
                reviewTitle: '',
                stars: 0,
                reviewDescription: '',
                username: '',
                beerName: '',
            }
       },
       
    }

}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

.main {
    color: white;
    font-family: Cousine, monospace;
}

.router {
    display: flex;
    align-items: center;
    justify-content: center;
}

.brewery {
    color: white;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-bottom: 20px;
    background: rgba(0, 0, 0, .8);
    border-radius: 18px;
    text-decoration: none;
}

.brewery:hover {
    text-decoration: underline;
    color: rgba(255, 183, 100, .8);
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;
    width: 100%;
}

.heading {
    background: rgba(0, 0, 0, .9);
    border-radius: 10px;
    padding: 1rem;
    width: 60%;
    margin: 10px;
}

.brewery-average {
    background: rgba(0, 0, 0, .9);
    text-align: center;
    margin: 0 20%;
    border-radius: 16px;
    padding: 15px;
    font-size: 2rem;
    color: rgb(255, 183, 100);
}

.reset-btn {
    color: black;
    background-color: rgb(255, 183, 100);;
}

#tblReviews {
    margin-top: 20px;
    margin-bottom: 20px;
    background: rgba(0, 0, 0, .9);
    width: 70%;
    text-align: center;
}

#tblReviews th {
    border: 1px solid white;
    padding-top: 5px;
    padding-bottom: 5px;
    text-align: center;
}

#tblReviews > th, td { 
    padding: 2px
}

#descriptionFilter {
    width: 80%;
}
</style>