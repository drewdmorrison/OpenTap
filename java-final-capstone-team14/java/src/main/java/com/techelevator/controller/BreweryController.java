package com.techelevator.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.HoursOfOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class BreweryController {

    private BreweryDao breweryDao;

    public BreweryController(BreweryDao breweryDao) {
        this.breweryDao = breweryDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/breweries", method = RequestMethod.GET)
    public List<Brewery> getBreweries() {
        return breweryDao.getBreweries();
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/breweries/{breweryId}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable Long breweryId) {
        return breweryDao.getBreweryById(breweryId);
    }

    @RequestMapping(value = "/breweries/name/{name}", method = RequestMethod.GET)
    public Brewery getBreweryByName(@PathVariable String name) {
        return breweryDao.getBreweryByName(name);
    }

    @RequestMapping(value = "/addBrewery", method = RequestMethod.POST)
    public Brewery addNewBrewery(@RequestBody @Valid Brewery brewery) {
        return breweryDao.addBrewery(brewery);
    }

    @RequestMapping(value = "/update-brewery", method = RequestMethod.PUT)
    public Brewery updateBrewery(@RequestBody Brewery brewery) {
        return breweryDao.updateBrewery(brewery);
    }

    @RequestMapping(value = "/brewery/{breweryId}/addHoursOfOperation", method = RequestMethod.POST)
    public List<HoursOfOperation> addNewHoursOfOperation(@PathVariable Long breweryId, @RequestBody List<HoursOfOperation> hoursOfOperations) {
        return breweryDao.addHoursOfOperation(breweryId, hoursOfOperations);
    }

    @RequestMapping(value = "/brewery/{breweryId}/set-approval", method = RequestMethod.PUT)
    public Brewery setApproval(@PathVariable Long breweryId, @RequestBody String isApproved) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(isApproved);
        boolean approval = jsonNode.path("isApproved").asBoolean();
        return breweryDao.updateBreweryApproval(breweryId, approval);
    }

    @RequestMapping(value = "/delete-brewery/{breweryId}", method = RequestMethod.DELETE)
    public boolean deleteBrewery(@PathVariable long breweryId) {
        return breweryDao.deleteBrewery(breweryId);
    }

    @RequestMapping(value = "/update-brewerId", method = RequestMethod.PUT)
    public Brewery updateBrewerId(@RequestBody String payload) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(payload);
        long breweryId = jsonNode.path("breweryId").asLong();
        long newBrewerId = jsonNode.path("brewerId").asLong();
        System.out.println(breweryId + " " + newBrewerId);
        Brewery brewery = getBreweryById(breweryId);
        brewery.setBrewerId(newBrewerId);
        return updateBrewery(brewery);
    }
}
