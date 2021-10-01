package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.HoursOfOperation;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBreweryDao implements BreweryDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Brewery> getBreweries() {
        List<Brewery> breweries = new ArrayList<>();
        String sql = "SELECT brewery_id, brewery_name, address, city, state_name, zip_code, " +
                "brewery_description, brewer_id, website, phone_number, brewery_photo, is_approved " +
                "FROM breweries ORDER BY brewery_name";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            breweries.add(brewery);
        }
        return breweries;
    }

    @Override
    public Brewery getBreweryById(Long breweryId) {
        Brewery brewery = new Brewery();
        String sql = "SELECT brewery_id, brewery_name, address, city, state_name, zip_code, " +
                "brewery_description, brewer_id, website, phone_number, brewery_photo, is_approved " +
                "FROM breweries WHERE brewery_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while(results.next()) {
            brewery = mapRowToBrewery(results);
        }
        brewery.setHoursOfOperation(getHoursOfOperation(breweryId));
        return brewery;
    }

    @Override
    public Brewery getBreweryByName(String name) {
        Brewery brewery = new Brewery();
        String sql = "SELECT brewery_id, brewery_name, address, city, state_name, zip_code, " +
                "brewery_description, brewer_id, website, phone_number, brewery_photo, is_approved " +
                "FROM breweries WHERE brewery_name ILIKE ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
        while(results.next()) {
            brewery = mapRowToBrewery(results);
        }
        return brewery;
    }

    @Override
    public List<HoursOfOperation> getHoursOfOperation(Long breweryId) {
        String sql = "SELECT day, time_open, time_closed FROM operations WHERE brewery_id = ? " +
                "ORDER BY day";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        List<HoursOfOperation> hoursOfOperationList = new ArrayList<>();
        while(results.next()) {
            HoursOfOperation hoursOfOperation = new HoursOfOperation();
            hoursOfOperation.setDayFromInt(results.getInt("day"));
            hoursOfOperation.setOpenedFromLocalTime(results.getTime("time_open").toLocalTime());
            hoursOfOperation.setClosedFromLocalTime(results.getTime("time_closed").toLocalTime());
            hoursOfOperation.setOpenedAsLocalTime(results.getTime("time_open").toLocalTime());
            hoursOfOperation.setClosedAsLocalTime(results.getTime("time_closed").toLocalTime());
            hoursOfOperationList.add(hoursOfOperation);
        }
        return hoursOfOperationList;
    }

    @Override
    public Brewery addBrewery(Brewery brewery) {
        String sql = "INSERT INTO breweries " +
                "(brewery_name, address, city, state_name, zip_code, " +
                "brewery_description, brewer_id, website, phone_number, brewery_photo, is_approved) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING brewery_id";
        Long breweryID = jdbcTemplate.queryForObject(sql, Long.class, brewery.getBreweryName(),
                brewery.getAddress(), brewery.getCity(), brewery.getStateName(), brewery.getZipCode(),
                brewery.getDescription(), brewery.getBrewerId(), brewery.getWebsite(), brewery.getPhoneNumber(),
                brewery.getBreweryPhoto(), brewery.isApproved());
        Brewery newBrewery = getBreweryById(breweryID);
        return newBrewery;
    }

    @Override
    public Brewery updateBrewery(Brewery updatedBrewery) {
        String sql = "UPDATE breweries SET brewery_name = ?, address = ?, city = ?, state_name = ?, zip_code = ?, " +
                "brewery_description = ?, brewer_id = ?, website = ?, phone_number = ?, brewery_photo = ?, is_approved = ? " +
                "WHERE brewery_id = ?";
        jdbcTemplate.update(sql,
                updatedBrewery.getBreweryName(), updatedBrewery.getAddress(), updatedBrewery.getCity(),
                updatedBrewery.getStateName(), updatedBrewery.getZipCode(), updatedBrewery.getDescription(),
                updatedBrewery.getBrewerId(), updatedBrewery.getWebsite(), updatedBrewery.getPhoneNumber(),
                updatedBrewery.getBreweryPhoto(), updatedBrewery.isApproved(), updatedBrewery.getBreweryId());
        updateHoursOfOperation(updatedBrewery.getBreweryId(), updatedBrewery.getHoursOfOperation());
        return getBreweryById(updatedBrewery.getBreweryId());
    }

    @Override
    public Brewery updateBreweryApproval(long breweryId, boolean isApproved) {
        String sql = "UPDATE breweries SET is_approved = ? WHERE brewery_id = ?";
        jdbcTemplate.update(sql, isApproved, breweryId);
        return getBreweryById(breweryId);
    }

    @Override
    public void updateHoursOfOperation(long breweryId, List<HoursOfOperation> hoursOfOperation) {
        for(HoursOfOperation day : hoursOfOperation) {
            String sql = "UPDATE operations SET time_open = ?, time_closed = ? WHERE brewery_id = ? AND day = ?";
            try {
                jdbcTemplate.update(sql, day.getOpenedAsLocalTime(), day.getClosedAsLocalTime(), breweryId, day.getDayAsInt());
            } catch (DataAccessException ex) {
                System.out.println(ex);
            }
        }
    }

    @Override
    public List<HoursOfOperation> addHoursOfOperation(long breweryId, List<HoursOfOperation> hoursOfOperations) {
        for(HoursOfOperation day : hoursOfOperations) {
            String sql = "INSERT INTO operations (day, time_open, time_closed, brewery_id) VALUES (?,?,?,?)";
            try {
                jdbcTemplate.update(sql, day.getDayAsInt(), day.getOpenedAsLocalTime(), day.getClosedAsLocalTime(), breweryId);
            } catch(DataAccessException ex) {
                System.out.println(ex);
            }
        }
        return getHoursOfOperation(breweryId);
    }

    @Override
    public boolean deleteBrewery(long breweryId) {
        String sql = "DELETE FROM breweries WHERE brewery_id = ?";
        try{
            jdbcTemplate.update(sql, breweryId);
            return true;
        } catch (DataAccessException ex) {
            System.out.println(ex);
            return false;
        }
    }

    private Brewery mapRowToBrewery(SqlRowSet rowSet) {
        Brewery brewery = new Brewery();
        brewery.setBreweryId(rowSet.getLong("brewery_id"));
        brewery.setBreweryName(rowSet.getString("brewery_name"));
        brewery.setAddress(rowSet.getString("address"));
        brewery.setCity(rowSet.getString("city"));
        brewery.setStateName(rowSet.getString("state_name"));
        brewery.setZipCode(rowSet.getString("zip_code"));
        brewery.setDescription(rowSet.getString("brewery_description"));
        brewery.setBrewerId(rowSet.getLong("brewer_id"));
        brewery.setWebsite(rowSet.getString("website"));
        brewery.setPhoneNumber(rowSet.getString("phone_number"));
        brewery.setBreweryPhoto(rowSet.getString("brewery_photo"));
        brewery.setApproved(rowSet.getBoolean("is_approved"));
        return brewery;
    }

}
