package com.example.demo.repository;
import com.response.entityDetails;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RestRepository extends JpaRepository<entityDetails, Long> {

    // Hotels Query
    @Query("SELECT new com.response.entityDetails(h.city, h.country, h.hotelType, h.budget) " +
           "FROM Hotels h WHERE h.country = ?1 AND h.budget <= ?2")
    List<entityDetails> findHotels(String country, int budget);

    // Attractions Query
    @Query("SELECT new com.response.entityDetails(a.city, a.country, a.attractionType, a.budget) " +
           "FROM Attractions a WHERE a.country = ?1")
    List<entityDetails> findAttractions(String country);

    // Activities Query
    @Query("SELECT new com.response.entityDetails(ac.city, ac.country, ac.activityType, ac.budget) " +
           "FROM Activities ac WHERE ac.country = ?1")
    List<entityDetails> findActivities(String country);

    // Restaurants Query
    @Query("SELECT new com.response.entityDetails(r.city, r.country, r.restaurantType, r.budget) " +
           "FROM Restaurants r WHERE r.country = ?1")
    List<entityDetails> findRestaurants(String country);

    // Shopping Query
    @Query("SELECT new com.response.entityDetails(s.city, s.country, s.marketSpeciality, s.budget) " +
           "FROM Shopping s WHERE s.country = ?1")
    List<entityDetails> findShopping(String country);

    // Transport Query
    @Query("SELECT new com.response.entityDetails(t.city, t.country, t.duration, t.budget) " +
           "FROM Transport t WHERE t.country = ?1")
    List<entityDetails> findTransport(String country);

    // Miscellaneous Query
    @Query("SELECT new com.response.entityDetails(m.city, m.country, m.duration, m.budget) " +
           "FROM Miscellaneous m WHERE m.country = ?1")
    List<entityDetails> findMiscellaneous(String country);
}
