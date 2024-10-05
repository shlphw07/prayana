package com.example.demo.service;

import com.request.*;
import com.response.*;
import com.example.demo.entity.*;
import com.example.demo.repository.RestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class RestService {

    private final RestRepository restRepository;

    @Autowired
    public RestService(RestRepository restRepository) {
        this.restRepository = restRepository;
    }

    public ResponseEntity<response> getItinerary(request requestObject) {
        // Determine country based on destination type
        String country = switch (requestObject.getDestinationType()) {
            case 0 -> "Egypt";
            case 1 -> "Mauritius";
            case 2 -> "Indonesia";
            case 3 -> "South Korea";
            default -> "None";
        };

        // Calculate hotel budget
        int hotelBudget = (int) (requestObject.getBudget() * 2) / (5 * requestObject.getGroupSize() * requestObject.getTripDuration());

        // Fetch data
        List<entityDetails> hotelsList = restRepository.findHotels(country, hotelBudget);
        List<entityDetails> attractionsList = restRepository.findAttractions(country);
        List<entityDetails> miscellaneousList = restRepository.findMiscellaneous(country);
        List<entityDetails> transportList = restRepository.findTransport(country);
        List<entityDetails> restaurantsList = restRepository.findRestaurants(country);
        List<entityDetails> shoppingList = restRepository.findShopping(country);
        List<entityDetails> activitiesList = restRepository.findActivities(country);

        // Create response
        response responseObject = new response();
        Map<String, Map<String, entityDetails>> itineraryMap = new HashMap<>();

        // Convert and add data to response
        itineraryMap.put("Hotels", convertToMap(hotelsList, "hotel_type"));
        itineraryMap.put("Attractions", convertToMap(attractionsList, "attraction_type"));
        itineraryMap.put("Must Try", convertToMap(miscellaneousList, "activity_type"));
        itineraryMap.put("Transport", convertToMap(transportList, "transport_type"));
        itineraryMap.put("Restaurants", convertToMap(restaurantsList, "restaurant_type"));
        itineraryMap.put("Shopping", convertToMap(shoppingList, "market_speciality"));
        itineraryMap.put("Activities", convertToMap(activitiesList, "activity_type"));

        responseObject.setItinerary(itineraryMap);
        return ResponseEntity.ok(responseObject);
    }

    private Map<String, entityDetails> convertToMap(List<?> list, String tagField) {
        Map<String, entityDetails> map = new HashMap<>();
        for (Object item : list) {
            entityDetails eDetails = new entityDetails();
            if (item instanceof Hotels) {
                Hotels hotel = (Hotels) item;
                eDetails.setCity(hotel.getCity());
                eDetails.setCountry(hotel.getCountry());
                eDetails.setPrice(hotel.getBudget());
                eDetails.setTag(hotel.getHotel_type());
                map.put(hotel.getName(), eDetails);
            } else if (item instanceof Attractions) {
                Attractions attraction = (Attractions) item;
                eDetails.setCity(attraction.getCity());
                eDetails.setCountry(attraction.getCountry());
                eDetails.setPrice(attraction.getTicketPrice());
                eDetails.setTag(attraction.getAttractionType());
                map.put(attraction.getName(), eDetails);
            } else if (item instanceof Miscellaneous) {
                Miscellaneous miscellaneous = (Miscellaneous) item;
                eDetails.setCity(miscellaneous.getCity());
                eDetails.setCountry(miscellaneous.getCountry());
                eDetails.setPrice(miscellaneous.getBudget());
                eDetails.setTag(miscellaneous.getActivityType());
                map.put(miscellaneous.getName(), eDetails);
            } else if (item instanceof Transport) {
                Transport transport = (Transport) item;
                eDetails.setCity(transport.getCity());
                eDetails.setCountry(transport.getCountry());
                eDetails.setPrice(transport.getBudget());
                eDetails.setTag(transport.getTransportType());
                map.put(transport.getName(), eDetails);
            } else if (item instanceof Restaurants) {
                Restaurants restaurant = (Restaurants) item;
                eDetails.setCity(restaurant.getCity());
                eDetails.setCountry(restaurant.getCountry());
                eDetails.setPrice(restaurant.getBudget());
                eDetails.setTag(restaurant.getRestaurantType());
                map.put(restaurant.getName(), eDetails);
            } else if (item instanceof Shopping) {
                Shopping shopping = (Shopping) item;
                eDetails.setCity(shopping.getCity());
                eDetails.setCountry(shopping.getCountry());
                eDetails.setPrice(shopping.getBudget());
                eDetails.setTag(shopping.getMarketSpeciality());
                map.put(shopping.getName(), eDetails);
            } else if (item instanceof Activities) {
                Activities activity = (Activities) item;
                eDetails.setCity(activity.getCity());
                eDetails.setCountry(activity.getCountry());
                eDetails.setPrice(activity.getBudget());
                eDetails.setTag(activity.getActivityType());
                map.put(activity.getName(), eDetails);
            }
        }
        return map;
    }
}
