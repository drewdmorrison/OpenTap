package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerReview;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerReviewDao implements BeerReviewDao {

    private JdbcTemplate jdbcTemplate;

     public JdbcBeerReviewDao(JdbcTemplate jdbcTemplate) {
         this.jdbcTemplate = jdbcTemplate;
     }

    @Override
    public List<BeerReview> getAllReviewsByBeerId(Long beerId) {
        List<BeerReview> reviews = new ArrayList<>();
        String sql = "SELECT review_id, re.beer_id, re.user_id, review_title, review_desc, stars, us.username, be" +
                ".beer_name " +
                     "FROM reviews re " +
                     "JOIN users us ON re.user_id = us.user_id " +
                     "JOIN beers be ON re.beer_id = be.beer_id " +
                     "WHERE re.beer_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId);
        while (results.next()) {
            BeerReview beerReview = mapRowToBeerReview(results);
            reviews.add(beerReview);
        }

        return reviews;
    }

    @Override
    public List<BeerReview> getAllReviewsByUserId(Long userId) {
        List<BeerReview> reviews = new ArrayList<>();
        String sql = "SELECT review_id, beer_id, user_id, review_title, review_desc, stars " +
                "FROM reviews " +
                "WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            BeerReview beerReview = mapRowToBeerReview(results);
            reviews.add(beerReview);
        }
        return reviews;
    }

    @Override
    public List<BeerReview> getReviewsByBreweryId(Long breweryId) {
        List<BeerReview> reviews = new ArrayList<>();
        String sql = "SELECT review_id, re.beer_id, re.user_id, review_title, review_desc, stars, br.brewery_id, br" +
                     ".brewery_name, us.username, be.beer_name " +
                     "FROM reviews re " +
                     "JOIN beers be ON re.beer_id = be.beer_id " +
                     "JOIN users us ON re.user_id = us.user_id " +
                     "JOIN beers_breweries bebr ON be.beer_id = bebr.beer_id " +
                     "JOIN breweries br ON bebr.brewery_id = br.brewery_id " +
                     "WHERE br.brewery_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while (results.next()) {
            BeerReview beerReview = mapRowToBeerReview(results);
            reviews.add(beerReview);
        }
        return reviews;
    }

    @Override
    public BeerReview getReviewById(Long reviewId) {
        BeerReview beerReview = new BeerReview();
        String sql = "SELECT review_id, beer_id, user_id, review_title, review_desc " +
                     "FROM reviews " +
                     "WHERE review_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, reviewId);
        while(results.next()) {
            beerReview = mapRowToBeerReview(results);
        }

        return beerReview;
    }

    @Override
    public BeerReview addBeerReview(BeerReview beerReview, Long breweryId, Long beerId) {
        String sql = "INSERT INTO reviews(beer_id, user_id, review_title, review_desc, stars) " +
                     "VALUES (?, ?, ?, ?, ?) RETURNING review_id ";
        Long reviewId = jdbcTemplate.queryForObject(sql, Long.class, beerReview.getBeerId(), beerReview.getUserId(),
                beerReview.getReviewTitle(), beerReview.getReviewDescription(), beerReview.getStars());
        BeerReview newReview = getReviewById(reviewId);
        return newReview;
    }

    private BeerReview mapRowToBeerReview(SqlRowSet rowSet) {
        BeerReview beerReview = new BeerReview();
        beerReview.setBeerId(rowSet.getLong("beer_id"));
        beerReview.setReviewId(rowSet.getLong("review_id"));
        beerReview.setUserId(rowSet.getLong("user_id"));
        beerReview.setReviewTitle(rowSet.getString("review_title"));
        beerReview.setReviewDescription(rowSet.getString("review_desc"));
//        beerReview.setStars(rowSet.getInt("stars"));
//        beerReview.setUsername(rowSet.getString("username"));
//        beerReview.setBeerName(rowSet.getString("beer_name"));
//        beerReview.setBreweryId(rowSet.getLong("brewery_id"));
//        beerReview.setBreweryName(rowSet.getString("brewery_name"));
        try {
            beerReview.setStars(rowSet.getInt("stars"));
            beerReview.setUsername(rowSet.getString("username"));
            beerReview.setBeerName(rowSet.getString("beer_name"));


        } catch (Exception ex) {}
        try {
            beerReview.setStars(rowSet.getInt("stars"));
            beerReview.setBreweryId(rowSet.getLong("brewery_id"));
            beerReview.setBreweryName(rowSet.getString("brewery_name"));

        } catch (Exception ex) {}
        return beerReview;

    }
}
