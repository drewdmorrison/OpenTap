package com.techelevator.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.dao.BeerDao;
import com.techelevator.model.Beer;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class BeerController {

    private BeerDao beerDao;

    public BeerController(BeerDao beerDao) {
        this.beerDao = beerDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/breweries/{breweryId}/beers", method = RequestMethod.GET)
    public List<Beer> getBeers(@PathVariable Long breweryId) {
        return beerDao.getBeersByBrewery(breweryId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/beers/{beerId}", method = RequestMethod.GET)
    public Beer getBeerById(@PathVariable Long beerId) {
        return beerDao.getBeerById(beerId);
    }

    @RequestMapping(value = "/addBeer", method = RequestMethod.POST)
    public Beer addBeer(@RequestBody Beer beer) throws JsonProcessingException {
        long newBeerTypeId = beerDao.addBeerType(beer.getBeerTypeName());
        beer.setBeerTypeId(newBeerTypeId);
        return beerDao.addBeer(beer);
    }

    @RequestMapping(value = "/removeBeer/{beerId}", method = RequestMethod.DELETE)
    public void deleteBeer(@PathVariable Long beerId) {
        beerDao.deleteBeer(beerId);
    }
}
