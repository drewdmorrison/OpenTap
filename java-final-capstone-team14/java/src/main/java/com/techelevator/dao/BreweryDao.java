package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.HoursOfOperation;

import java.util.List;

public interface BreweryDao {

    List<Brewery> getBreweries();

    Brewery getBreweryById(Long breweryId);

    Brewery getBreweryByName(String name);

    List<HoursOfOperation> getHoursOfOperation(Long breweryId);

    Brewery addBrewery(Brewery brewery);

    Brewery updateBrewery(Brewery updatedBrewery);

    Brewery updateBreweryApproval(long breweryId, boolean isApproved);

    boolean deleteBrewery(long breweryId);

    void updateHoursOfOperation(long breweryId, List<HoursOfOperation> hoursOfOperation);

    List<HoursOfOperation> addHoursOfOperation(long breweryId, List<HoursOfOperation> hoursOfOperations);
}
