package com.example.demo.controller;
import com.response.*;
import com.request.*;
import com.example.demo.service.RestService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")

public class RestApiController {

    @Autowired
    private RestService restService ;
    
      
    // Example GET endpoint
    @GetMapping("/itinerary")
    public ResponseEntity<response> getHotels(@RequestBody request requestObject) {
        return ResponseEntity.ok().body(restService.getItinerary(requestObject).getBody());
              
    }

    
}
