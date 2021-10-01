package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {

    List<Beer> getBeersByBrewery (Long breweryId);
    Beer getBeerById(Long beerId);
    long addBeerType(String beerTypeName);
    Beer addBeer(Beer newBeer);
    boolean addBeerToBeersBreweries(long beerId, long breweryId);
    void deleteBeer(long beerId);

}
