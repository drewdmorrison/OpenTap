import axios from 'axios';

export default {

    //Request is a object with (userId, typeId, statusId, breweryId)
    makeRequest(request) {
        return axios.post("/addRequest", request);
    },

    getRequests() {
        return axios.get("/requests");
    },

    updateRequest(updatedRequest) {
        return axios.put("/requests", updatedRequest);
    },

    deleteRequest(requestId) {
        return axios.delete(`/${requestId}`);
    }

}