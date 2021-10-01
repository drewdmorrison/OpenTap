<template>
    <div class="requests-container">
        <router-link class="link-home" :to="{name: 'home'}" tag="h3">Back to Home</router-link>
        <h1>Requests</h1>
        <h3 class="no-requests-heading" v-if="requests.length == 0">No Requests</h3>
        <div v-for="request in requests" :key="request.requestId" @click.stop="toggleDetails(request)"
            class="request-link"
        >
            <p>RequestID:{{ request.requestId }}</p> 
            <p>Type:{{ request.typeName }}</p>
            <p>Status:{{ request.status }}</p>
            <div v-if="!Object.is(selectedRequest, {}) && request.requestId === selectedRequest.requestId"
                class="request-details"
            >
                <p>UserID: {{ selectedRequest.userId }}</p>
                <p>BreweryID: {{ selectedRequest.breweryId }}</p>
                <br>
                <div class="buttons">
                    <button @click.stop="updateRequest(2)" class="approve">Approve</button>
                    <button @click.stop="updateRequest(3)" class="decline">Decline</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import requestService from "@/services/RequestService.js";
import breweryService from "@/services/BreweryService.js";

export default {
    data() {
        return {
            requests: [],
            selectedRequest: {}
        }
    },
    created() {
        requestService.getRequests().then(
            (response) => {
                this.requests = response.data;
            }
        )
    },
    methods: {
        toggleDetails(request) {
            if(!Object.is(this.selectedRequest, request)) {
                this.selectedRequest = request;
            } else {
                this.selectedRequest = {}
            }
        },
        updateRequest(statusId) {
            //2 = approved, 3 = rejected
            this.selectedRequest.statusId = statusId;
            requestService.updateRequest(this.selectedRequest).then(
                (response) => {
                    this.selectedRequest = response.data;
                    requestService.getRequests().then(
                        (response) => {
                            this.requests = response.data;
                        }
                    );
                }
            );
            if(this.selectedRequest.typeId == 1) {
                this.updateBreweryApproval(statusId == 2 ? true : false);
            } else if (this.selectedRequest.typeId == 2) {
                this.updateBrewerId(statusId == 2 ? true : false);
            }
        },

        updateBrewerId(isApproved) {
            if(isApproved) {
                breweryService.updateBrewerId(this.selectedRequest.breweryId, this.selectedRequest.userId).then(
                    (response) => {
                        if(response.status == 200) {
                            window.alert("Approved");
                        }
                    }
                );
            } else {
                let adminId = 1001
                breweryService.updateBrewerId(this.selectedRequest.breweryId, adminId).then(
                    (response) => {
                        if(response.status == 200) {
                            window.alert("Rejected");
                        }
                    }
                );
            }
        },

        updateBreweryApproval(isApproved) {
            breweryService.updateBreweryApproval(this.selectedRequest.breweryId, { "isApproved": isApproved }).then(
                (response) => {
                   if(response.status == 200) {
                       if(isApproved == true){
                           window.alert("Request Approved");
                       } else {
                           window.alert("Request Declined");
                       }
                   } 
                }
            )
        }
    }

}
</script>

<style scoped>

    .requests-container {
        width: 60%;
        margin-left: 20%;
        margin-right: 20%;
        margin-bottom: 8%;
        margin-top: 4%;
        padding-bottom: 2.4rem;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background: rgba(0, 0, 0, .8);
        border-radius: 4px;
        color: white;
        font-family: Cousine, 'Montserrat', sans-serif;
    }

    .request-link {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: 15px; 
    }

    .request-link:hover {
        cursor: pointer;
        color: rgb(220, 220, 220);
        
    }

    .request-details {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    p {
        text-decoration: none;
    }

    h1 {
        text-decoration: underline;
    }

    button {
        color: black;
        cursor: pointer;
        font-weight: bold;
    }

    .approve {
        background: rgb(255, 183, 100);
    }

    .decline {
        background-color: rgb(255, 10, 10);
    }


    .no-requests-heading {
        margin: 20px;
    }

    .link-home {
        color: white;
        text-align: center;
        width: 200px;
        padding-left: 10px;
        padding-right: 10px;
        margin-top: 30px;
        text-decoration: none;
    }

    .link-home:hover {
        text-decoration: underline;
        color: rgba(255, 183, 100, .8);
        cursor: pointer;
    }
</style>