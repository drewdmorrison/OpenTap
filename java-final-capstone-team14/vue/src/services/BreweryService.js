import axios from 'axios';

export default {

    getBreweries() {
        return axios.get('/breweries');
    },

    getBreweryById(breweryId) {
        return axios.get(`/breweries/${breweryId}`);
    },

    addNewBrewery(brewery) {
        return axios.post('/addBrewery', brewery);
    },

    updateBrewery(updatedBrewery) {
        return axios.put("/update-brewery", updatedBrewery);
    },
    
    updateBreweryApproval(breweryId, approvalAsObject) {
        return axios.put(`/brewery/${breweryId}/set-approval`, approvalAsObject);
    },

    addHoursOfOperation(breweryId, hoursOfOperation) {
        return axios.post(`/brewery/${breweryId}/addHoursOfOperation`, hoursOfOperation);
    },

    updateBrewerId(breweryId, newUserId) {
        let payload = {
            breweryId: breweryId,
            brewerId: newUserId
        }
        return axios.put("/update-brewerId", payload);
    }

}