package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Restaurants {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String city;
    private String country;
    private String locationLink;
    private String imageLink;
    private String restaurantType;
    private int budget;
    private int rating;
    private String cuisine;
    private boolean vegan;
    private boolean nonVeg;
    private String restaurantSpeciality;
     
   
}
