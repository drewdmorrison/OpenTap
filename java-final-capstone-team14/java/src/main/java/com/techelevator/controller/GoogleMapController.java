package com.techelevator.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Brewery;
import com.techelevator.model.Location;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;



@CrossOrigin
@RestController
public class GoogleMapController {

    @Value("${google.api.key}")
    String apiKey;

    @RequestMapping(path = "/coordinates", method = RequestMethod.POST)
    public Location getLatitudeAndLongitude(@RequestBody Brewery brewery) {
        String query = String.format("%s+%s+%s+%s", convertToPSV(brewery.getAddress()), convertToPSV(brewery.getCity()), brewery.getStateName(), brewery.getZipCode());
        String url = String.format("https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=%s", query, apiKey);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        ObjectMapper objectMapper = new ObjectMapper();

        Location location = new Location(0,0);
        try {
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            JsonNode results = jsonNode.path("results");
            Double lat = results.path(0).path("geometry").path("location").path("lat").asDouble();
            Double lng = results.path(0).path("geometry").path("location").path("lng").asDouble();
            location = new Location(lat, lng);

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return location;
    }

    //Converts string to plus separated value. Ex(1223 Smithfield Street => 1223+Smithfield+Street)
    private static String convertToPSV(String str) {
        str = str.trim();
        String[] array = str.split(" ");
        String result = String.join("+", array);
        return result;
    }
}
