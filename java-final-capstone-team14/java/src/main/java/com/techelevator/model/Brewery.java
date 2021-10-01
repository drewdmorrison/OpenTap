package com.techelevator.model;

import java.util.List;

public class Brewery {

    private long breweryId;
    private String breweryName;
    private String address;
    private String city;
    private String stateName;
    private String zipCode;
    private String description;
    private long brewerId;
    private String website;
    private String phoneNumber;
    private String breweryPhoto;
    private boolean isApproved;
    private List<HoursOfOperation> hoursOfOperation;

    public Brewery(long breweryId, String breweryName, String address, String stateName, String zipCode,
                   String description, long brewerId, String website, String phoneNumber, String breweryPhoto,
                   List<HoursOfOperation> hoursOfOperation, boolean isApproved) {
        this.breweryId = breweryId;
        this.breweryName = breweryName;
        this.address = address;
        this.stateName = stateName;
        this.zipCode = zipCode;
        this.description = description;
        this.brewerId = brewerId;
        this.website = website;
        this.phoneNumber = phoneNumber;
        this.breweryPhoto = breweryPhoto;
        this.hoursOfOperation = hoursOfOperation;
        this.isApproved = isApproved;
    }

    public Brewery() {

    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(long breweryId) {
        this.breweryId = breweryId;
    }

    public String getBreweryName() {
        return breweryName;
    }

    public void setBreweryName(String breweryName) {
        this.breweryName = breweryName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getBrewerId() {
        return brewerId;
    }

    public void setBrewerId(long brewerId) {
        this.brewerId = brewerId;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBreweryPhoto() {
        return breweryPhoto;
    }

    public void setBreweryPhoto(String breweryPhoto) {
        this.breweryPhoto = breweryPhoto;
    }

    public List<HoursOfOperation> getHoursOfOperation() {
        return hoursOfOperation;
    }

    public void setHoursOfOperation(List<HoursOfOperation> hoursOfOperation) {
        this.hoursOfOperation = hoursOfOperation;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    @Override
    public String toString() {
        return "Brewery{" +
                "breweryId=" + breweryId +
                ", breweryName='" + breweryName + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", stateName='" + stateName + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", description='" + description + '\'' +
                ", brewerId=" + brewerId +
                ", website='" + website + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", breweryPhoto='" + breweryPhoto + '\'' +
                ", isApproved=" + isApproved +
                ", hoursOfOperation=" + hoursOfOperation +
                '}';
    }
}
