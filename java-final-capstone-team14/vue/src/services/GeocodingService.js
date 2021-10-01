import axios from 'axios';


export default {
    getLatitudeAndLongitude(brewery) {
        let payload = {
            "address": brewery.address,
            "city": brewery.city,
            "stateName": brewery.stateName,
            "zipCode": brewery.zipCode
        }
        return axios.post("/coordinates", payload);
    }

}