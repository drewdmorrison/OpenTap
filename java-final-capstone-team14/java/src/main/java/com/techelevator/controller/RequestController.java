package com.techelevator.controller;


import com.techelevator.dao.RequestDao;
import com.techelevator.model.Request;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class RequestController {

    private RequestDao requestDao;

    public RequestController(RequestDao requestDao) {
        this.requestDao = requestDao;
    }

    @RequestMapping(value = "/addRequest", method = RequestMethod.POST)
    public Request addNewRequest(@RequestBody Request request) {
        return requestDao.addRequest(request);
    }

    @RequestMapping(value = "/requests", method = RequestMethod.GET)
    public List<Request> getRequests() {
        return requestDao.getRequests();
    }

    @RequestMapping(value = "/requests", method = RequestMethod.PUT)
    public Request updateRequest(@RequestBody Request request) {
        return requestDao.updateStatusOfRequest(request);
    }

    @RequestMapping(value = "/{requestId}", method = RequestMethod.DELETE)
    public boolean deleteRequest(@PathVariable int requestId) {
        return requestDao.deleteRequest(requestId);
    }

}
