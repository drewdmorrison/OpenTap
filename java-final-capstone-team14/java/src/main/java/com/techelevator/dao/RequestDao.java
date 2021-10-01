package com.techelevator.dao;

import com.techelevator.model.Request;

import java.util.List;

public interface RequestDao {
    Request addRequest(Request request);
    Request getRequestById(int id);
    List<Request> getRequests();
    Request updateStatusOfRequest(Request request);
    boolean deleteRequest(int id);
}
