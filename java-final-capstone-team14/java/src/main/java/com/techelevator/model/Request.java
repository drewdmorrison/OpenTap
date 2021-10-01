package com.techelevator.model;

import java.util.Map;

public class Request {
    private int requestId;
    private int userId;
    private int statusId;
    private int typeId;
    private int breweryId;
    private String status;
    private String typeName;

    private static final Map<Integer, String> statusKey = Map.of(
            1, "Pending",
            2, "Approved",
            3, "Rejected"
    );

    private static final Map<Integer, String> typeKey = Map.of(
            1, "Brewery"
    );



    public Request() {

    }

    public Request(int requestId, int userId, int statusId, int typeId, int breweryId) {
        this.requestId = requestId;
        this.userId = userId;
        this.statusId = statusId;
        this.typeId = typeId;
        this.breweryId = breweryId;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    //    public int getStatusId() {
//        for(Map.Entry<Integer, String> entry : statusKey.entrySet()) {
//            if(entry.getValue().equalsIgnoreCase(this.status)) {
//                return entry.getKey();
//            }
//        }
//        return 0;
//    }


//    public int getTypeId() {
//        for(Map.Entry<Integer, String> entry : typeKey.entrySet()) {
//            if(entry.getValue().equalsIgnoreCase(this.type)) {
//                return entry.getKey();
//            }
//        }
//        return 0;
//    }


    @Override
    public String toString() {
        return "ID: " + this.requestId + " USERID: " + this.userId + " STATUS: " + this.statusId + " TYPE: " + this.typeId + " BreweryID: " + this.breweryId;
    }
}
