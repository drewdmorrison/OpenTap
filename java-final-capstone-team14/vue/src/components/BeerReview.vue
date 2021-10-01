<template>
    <div class="main">
        <div class="router">
        <router-link :to="{name: 'beers', params: {breweryId: $route.params.breweryId}}" class="links">Back to Beers</router-link>
        <router-link :to="{name: 'addReview', params: {beerId: $route.params.beerId}}" class="links">Add Beer Review</router-link>
        </div>
        <div v-if="reviews.length != 0" class="container">
            <!-- <div class="container"> -->
                <h1 class="heading">Reviews for {{reviews[0].beerName}}</h1>
                <span class="average">Average Rating of: {{ averageRating }} Pints</span>
                <div v-for="review in reviews" :key="review.reviewId" class="review">
                    <h4 class="reviewer-name review-info">{{ review.username }}</h4>
                    <p class="review-info">{{ review.stars}} Pints</p>
                    <h3 class="review-info">{{ review.reviewTitle }}</h3>
                    <p class="review-info">{{ review.reviewDescription }}</p> 
                </div>
            <!-- </div> -->
        </div>
        <p class="no-reviews-msg" v-else>No reviews yet.. You should be the first!</p>
    </div>
</template>

<script>
import reviewService from "@/services/ReviewService.js";

export default {
    name: 'beer-review',
    data() {
        return {
            reviews: [],
        }
    },
    created() {
        reviewService.getReviewsByBeerId(this.$route.params.beerId)
        .then((response) => {
            this.reviews = response.data;
        })
    },
    computed: {
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

.links {
    color: black;
    text-align: center;
    width: 200px;
    padding: 10px;
    margin-bottom: 20px;
    background: rgba(255, 255, 255, .9);
    border-radius: 18px;
    text-decoration: none;
    margin: 20px;
    font-weight: bold;

    border: 1px black solid;
}

.links:hover {
    text-decoration: underline;
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
    width: 55%;
    margin: 10px;
}

.review {
    border-radius: 6px;
    padding: 1rem;
    margin: 10px;
    background: rgba(0, 0, 0, .9);
    text-align: center;
    width: 50%;
}

.review-info {
    margin: 5px;
}

.no-reviews-msg {
    background: rgba(0, 0, 0, .9);
    text-align: center;
    margin: 0 25%;
    border-radius: 16px;
    padding: 15px;
    font-size: 2.5rem;
    
}

.average {
    background: rgba(0, 0, 0, .9);
    color: rgba(255, 183, 100, 0.8);
    text-align: center;
    margin: 0 40%;
    border-radius: 16px;
    padding: 15px;
    font-size: 2rem;
    width: 40%;
}

@media (max-width: 769px) {
    .container {
        width: 96%;
        margin: 5% 2%;
    }

    .heading {
        width: 88%;
    }
    .review {
        width: 88%;
        margin: 2% 2%;
    }

    .no-reviews-msg {
        margin: 10% 20%;
        font-size: 1.7rem;
    }

    .average {
        margin: 10% 20%;
        font-size: 1.7rem;
    }
}
</style>