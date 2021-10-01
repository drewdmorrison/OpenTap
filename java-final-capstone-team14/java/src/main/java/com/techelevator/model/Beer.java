package com.techelevator.model;

public class Beer {

    private long beerId;
    private String beerName;
    private String beerDescription;
    private long beerTypeId;
    private double abv;
    private int ibu;
    private String beerPhoto;
    private String beerTypeName;
    private long breweryId;

    public Beer() {}

    public long getBeerId() {
        return beerId;
    }

    public void setBeerId(long beerId) {
        this.beerId = beerId;
    }

    public String getBeerName() {
        return beerName;
    }

    public void setBeerName(String beerName) {
        this.beerName = beerName;
    }

    public String getBeerDescription() {
        return beerDescription;
    }

    public void setBeerDescription(String beerDescription) {
        this.beerDescription = beerDescription;
    }

    public long getBeerTypeId() {
        return beerTypeId;
    }

    public void setBeerTypeId(long beerTypeId) {
        this.beerTypeId = beerTypeId;
    }

    public double getAbv() {
        return abv;
    }

    public void setAbv(double abv) {
        this.abv = abv;
    }

    public int getIbu() {
        return ibu;
    }

    public void setIbu(int ibu) {
        this.ibu = ibu;
    }

    public String getBeerPhoto() {
        return beerPhoto;
    }

    public void setBeerPhoto(String beerPhoto) {
        this.beerPhoto = beerPhoto;
    }

    public String getBeerTypeDesc() {
        return beerTypeName;
    }

    public void setBeerTypeDesc(String beerTypeDesc) {
        this.beerTypeName = beerTypeDesc;
    }

    public long getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(long breweryId) {
        this.breweryId = breweryId;
    }

    public String getBeerTypeName() {
        return beerTypeName;
    }

    public void setBeerTypeName(String beerTypeName) {
        this.beerTypeName = beerTypeName;
    }

    @Override
    public String toString() {
        return "Beer{" +
                "beerId=" + beerId +
                ", beerName='" + beerName + '\'' +
                ", beerDescription='" + beerDescription + '\'' +
                ", beerTypeId=" + beerTypeId +
                ", abv=" + abv +
                ", ibu=" + ibu +
                ", beerPhoto='" + beerPhoto + '\'' +
                ", beerTypeName='" + beerTypeName + '\'' +
                ", breweryId=" + breweryId +
                '}';
    }
}
