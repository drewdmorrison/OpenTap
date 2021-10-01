package com.techelevator.dao;

import com.techelevator.model.Request;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
public class JdbcRequestDao implements RequestDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcRequestDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Request addRequest(Request request) {
        String sql = "INSERT INTO requests (user_id, status_id, type_id, brewery_id) VALUES (?, ?, ?, ?) RETURNING request_id";
        int newRequestId = jdbcTemplate.queryForObject(sql, Integer.class, request.getUserId(),
                                request.getStatusId(), request.getTypeId(), request.getBreweryId());
        return getRequestById(newRequestId);
    }

    @Override
    public Request getRequestById(int id) {
        String sql = "SELECT request_id, user_id, requests.status_id, requests.type_id, brewery_id, status_name, type_name " +
                "FROM requests " +
                "JOIN status ON requests.status_id = status.status_id " +
                "JOIN request_type ON requests.type_id = request_type.type_id " +
                "WHERE request_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        Request request = null;
        while(results.next()) {
            request = mapRowToRequest(results);
        }
        return request;
    }

    @Override
    public List<Request> getRequests() {
        List<Request> requests = new ArrayList<>();
        String sql = "SELECT request_id, user_id, requests.status_id, requests.type_id, brewery_id, status_name, type_name " +
                "FROM requests " +
                "JOIN status ON requests.status_id = status.status_id " +
                "JOIN request_type ON requests.type_id = request_type.type_id";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Request request = mapRowToRequest(results);
            requests.add(request);
        }
        return requests;
    }

    @Override
    public Request updateStatusOfRequest(Request request) {
        String sql = "UPDATE requests SET status_id = ? WHERE request_id = ?";
        jdbcTemplate.update(sql, request.getStatusId(), request.getRequestId());
        return getRequestById(request.getRequestId());
    }

    @Override
    public boolean deleteRequest(int id) {
        String sql = "DELETE FROM requests WHERE request_id = ?";
        try{
            jdbcTemplate.update(sql, id);
            return true;
        } catch (DataAccessException ex) {
            System.out.println(ex);
            return false;
        }
    }

    private Request mapRowToRequest(SqlRowSet rowSet) {
        Request request = new Request();
        request.setRequestId(rowSet.getInt("request_id"));
        request.setUserId(rowSet.getInt("user_id"));
        request.setStatusId(rowSet.getInt("status_id"));
        request.setTypeId(rowSet.getInt("type_id"));
        request.setBreweryId(rowSet.getInt("brewery_id"));
        request.setStatus(rowSet.getString("status_name"));
        request.setTypeName(rowSet.getString("type_name"));
        return request;
    }
}
