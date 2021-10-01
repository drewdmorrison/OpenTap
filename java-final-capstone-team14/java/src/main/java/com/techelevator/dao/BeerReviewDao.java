package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerReview;

import java.util.List;

public interface BeerReviewDao {

    List<BeerReview> getAllReviewsByBeerId(Long beerId);
    List<BeerReview> getAllReviewsByUserId(Long userId);
    List<BeerReview> getReviewsByBreweryId(Long breweryId);
    BeerReview addBeerReview(BeerReview beerReview, Long breweryId, Long beerId);
    BeerReview getReviewById(Long reviewId);


}
