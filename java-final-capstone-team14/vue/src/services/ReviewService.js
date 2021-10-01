import axios from 'axios';

export default {

    getReviewsByBeerId(beerId) {
        return axios.get(`/beers/reviews/${beerId}`);
    },
    addNewReview(review, breweryId, beerId) {
        return axios.post(`${breweryId}/beers/${beerId}/addReview`, review);
    },
    getReviewsByBreweryId(breweryId) {
        return axios.get(`/${breweryId}/beers/reviews`);
    },
}