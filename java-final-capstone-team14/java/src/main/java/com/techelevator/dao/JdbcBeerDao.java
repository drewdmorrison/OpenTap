package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> getBeersByBrewery(Long breweryId) {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT be.beer_id, beer_name, beer_description, beer_type_id, abv, ibu, beer_photo " +
                     "FROM beers be " +
                     "JOIN beers_breweries bebr ON be.beer_id = bebr.beer_id " +
                     "JOIN breweries br ON bebr.brewery_id = br.brewery_id " +
                     "WHERE br.brewery_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while (results.next()) {
            Beer beer = mapRowToBeer(results);
            beers.add(beer);
        }
        return beers;
    }

    @Override
    public Beer getBeerById(Long beerId) {
        Beer beer = new Beer();
        String sql = "SELECT be.beer_id, beer_name, bt.beer_type_name, be.beer_type_id, beer_description, abv, ibu, " +
                "beer_photo, bebr.brewery_id " +
                     "FROM beers be " +
                     "JOIN beer_type bt ON be.beer_type_id = bt.beer_type_id " +
                     "JOIN beers_breweries bebr ON be.beer_id = bebr.beer_id " +
                     "WHERE be.beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId);
        while(results.next()) {
            beer = mapRowToBeer(results);
        }

        return beer;
    }



    @Override
    public void deleteBeer(long beerId) {
        String sql = "DELETE from beers_breweries WHERE beer_id = ?;" +
                     "DELETE from reviews WHERE beer_id = ?;" +
                     "DELETE from beers WHERE beer_id = ?;";
        jdbcTemplate.update(sql, beerId, beerId, beerId);
    }



    @Override
    public long addBeerType(String beerTypeName) {
        try {
            String sql = "SELECT beer_type_id, beer_type_name FROM beer_type WHERE beer_type_name = ?";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerTypeName);
            int beerTypeId = -1;
            while(results.next()) {
                beerTypeId = results.getInt("beer_type_id");
            }
            if(beerTypeId == -1) {
                String insertSql = "INSERT INTO beer_type (beer_type_name) VALUES (?) RETURNING beer_type_id";
                long newBeerTypeId = jdbcTemplate.queryForObject(insertSql, Long.class, beerTypeName);
                return newBeerTypeId;
            } else {
                return beerTypeId;
            }
        } catch (DataAccessException ex) {
            System.out.println(ex.getMessage());
        }
        return -1;
    }

    @Override
    public Beer addBeer(Beer newBeer) {
        String sql = "INSERT INTO beers (beer_name, beer_description, beer_type_id, abv, ibu, beer_photo) " +
                "VALUES (?, ?, ?, ?, ?, ?) RETURNING beer_id";
        long newBeerId = jdbcTemplate.queryForObject(sql, Long.class, newBeer.getBeerName(),
                newBeer.getBeerDescription(), newBeer.getBeerTypeId(), newBeer.getAbv(),
                newBeer.getIbu(), newBeer.getBeerPhoto());
        addBeerToBeersBreweries(newBeerId, newBeer.getBreweryId());
        return getBeerById(newBeerId);
    }

    @Override
    public boolean addBeerToBeersBreweries(long beerId, long breweryId) {
        String sql = "INSERT INTO beers_breweries (beer_id, brewery_id) VALUES (?, ?)";
        try {
            jdbcTemplate.update(sql, beerId, breweryId);
            return true;
        } catch (DataAccessException ex) {
            System.out.println(ex);
            return false;
        }
    }

    private Beer mapRowToBeer(SqlRowSet rowSet) {
        Beer beer = new Beer();
        beer.setBeerId(rowSet.getLong("beer_id"));
        beer.setBeerName(rowSet.getString("beer_name"));
        beer.setBeerDescription(rowSet.getString("beer_description"));
        try {
            beer.setBeerTypeDesc(rowSet.getString(("beer_type_name")));
            beer.setBreweryId(rowSet.getLong("brewery_id"));
        } catch (Exception ex) {}
        beer.setBeerTypeId(rowSet.getLong("beer_type_id"));
        beer.setAbv(rowSet.getDouble("abv"));
        beer.setIbu(rowSet.getInt("ibu"));
        beer.setBeerPhoto(rowSet.getString("beer_photo"));

        return beer;
    }

}
