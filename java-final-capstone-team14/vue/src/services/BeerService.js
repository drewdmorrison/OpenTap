import axios from 'axios';

export default {

    getBeersByBreweryId(breweryId) {
        return axios.get(`/breweries/${breweryId}/beers`);
    },

    getBeerById(beerId) {
        return axios.get(`/beers/${beerId}`);
    },

    addBeer(beerToAdd) {
        //Required properties: beerName, beerTypeName, beerDescription, abv, ibu, beerPhoto, breweryId
        return axios.post('/addBeer', beerToAdd);
    },

    deleteBeer(beerId) {
        return axios.delete(`/removeBeer/${beerId}`);
    }

}