package com.techelevator.controller;

import com.techelevator.dao.BeerReviewDao;
import com.techelevator.model.BeerReview;
import org.apache.coyote.Request;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class BeerReviewController {

    private BeerReviewDao beerReviewDao;

    public BeerReviewController(BeerReviewDao beerReviewDao) {
        this.beerReviewDao = beerReviewDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/beers/reviews/{beerId}", method = RequestMethod.GET)
    public List<BeerReview> getAllReviewsByBeerId(@PathVariable Long beerId) {
        return beerReviewDao.getAllReviewsByBeerId(beerId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/beers/reviews/user/{userId}", method = RequestMethod.GET)
    public List<BeerReview> getAllReviewsByUserId(@PathVariable Long userId) {
        return beerReviewDao.getAllReviewsByUserId(userId);
    }

    @RequestMapping(value = "/{breweryId}/beers/{beerId}/addReview", method = RequestMethod.POST)
    public BeerReview addNewBeerReview(@RequestBody @Valid BeerReview beerReview, @PathVariable Long breweryId,
                                       Long beerId) {
        return beerReviewDao.addBeerReview(beerReview, breweryId, beerId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(value = "/{breweryId}/beers/reviews", method = RequestMethod.GET)
    public List<BeerReview> getAllReviewsByBreweryId(@PathVariable Long breweryId) {
        return beerReviewDao.getReviewsByBreweryId(breweryId);
    }

}
